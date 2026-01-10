import os
import io
import shutil
import math
from PIL import Image

# Конфигурация
MAX_SIZE_BYTES = 5 * 1024 * 1024       # 5 MB
TARGET_MIN_BYTES = 4.2 * 1024 * 1024   # 4.2 MB
TARGET_MAX_BYTES = 4.95 * 1024 * 1024  # 4.95 MB

def get_size(path):
    return os.path.getsize(path)

def compress_file(filepath):
    filename = os.path.basename(filepath)
    original_size = get_size(filepath)
    
    # Пропускаем, если файл и так нормальный
    if original_size <= MAX_SIZE_BYTES:
        return

    print(f"\n[START] {filename}")
    print(f"Original Size: {original_size / 1024 / 1024:.2f} MB")
    
    # Создаем бэкап
    backup_path = filepath + ".bak"
    shutil.copy(filepath, backup_path)
    
    try:
        with Image.open(filepath) as img:
            # Загружаем в память, чтобы не держать файл
            img.load()
            fmt = img.format
            
            # Начальные параметры
            scale = 1.0
            quality = 95
            attempt = 0
            
            # Буфер для сохранения
            output = io.BytesIO()

            while True:
                attempt += 1
                output.seek(0)
                output.truncate(0)
                
                # 1. Ресайз (если нужен)
                if scale < 1.0:
                    new_w = int(img.width * scale)
                    new_h = int(img.height * scale)
                    # Используем BILINEAR для скорости, LANCZOS для качества. 
                    # Если висит - BILINEAR быстрее.
                    cur_img = img.resize((new_w, new_h), Image.Resampling.LANCZOS)
                else:
                    cur_img = img

                # 2. Сохранение в буфер
                # Для PNG убрали optimize=True, так как это очень долго
                if fmt == 'PNG':
                    cur_img.save(output, format='PNG')
                elif fmt in ('JPEG', 'JPG'):
                    cur_img.save(output, format='JPEG', quality=quality)
                else:
                    # Fallback для других форматов
                    cur_img.save(output, format=fmt)
                
                size = output.tell()
                print(f"   Iter {attempt}: Scale={scale:.2f} | Quality={quality} -> {size / 1024 / 1024:.2f} MB")

                # 3. Проверка условий выхода
                if size < MAX_SIZE_BYTES:
                    # Если попали в цель или файл стал даже меньше минимума (но это ок)
                    print(f"   [DONE] Writing {size / 1024 / 1024:.2f} MB to disk...")
                    with open(filepath, "wb") as f:
                        f.write(output.getvalue())
                    break
                
                # 4. Вычисление следующего шага
                # Если файл всё еще огромен, уменьшаем агрессивнее
                ratio = MAX_SIZE_BYTES / size
                
                if fmt == 'PNG':
                    # PNG зависит только от размера пикселей (при lossy=False)
                    # Следующий scale должен уменьшить площадь примерно пропорционально
                    # Площадь ~ scale^2. New_scale ~ Current_scale * sqrt(ratio)
                    next_scale_factor = math.sqrt(ratio) * 0.95 # 0.95 для запаса
                    scale = scale * next_scale_factor
                else:
                    # JPEG уменьшаем качество и немного размер
                    quality -= 5
                    if quality < 70:
                        quality = 85
                        scale *= 0.9
                
                # Защита от бесконечного цикла
                if scale < 0.1:
                    print("   [FAIL] Could not compress enough without destroying image.")
                    break

    except Exception as e:
        print(f"   [ERROR] {e}")
        # Восстанавливаем бэкап при ошибке
        shutil.copy(backup_path, filepath)

def main():
    exts = ('.png', '.jpg', '.jpeg')
    files = [f for f in os.listdir('.') if f.lower().endswith(exts)]
    
    count = 0
    for f in files:
        if get_size(f) > MAX_SIZE_BYTES:
            compress_file(f)
            count += 1
            
    if count == 0:
        print("No huge files found.")
    else:
        print("\nAll done.")

if __name__ == "__main__":
    main()
