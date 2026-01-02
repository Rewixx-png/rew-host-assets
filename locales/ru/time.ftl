days-count = { $count ->
    [one] { $count } день
    [few] { $count } дня
   *[many] { $count } дней
}

hours-count = { $count ->
    [one] { $count } час
    [few] { $count } часа
   *[many] { $count } часов
}

minutes-count = { $count ->
    [one] { $count } минута
    [few] { $count } минуты
   *[many] { $count } минут
}

seconds-count = { $count ->
    [one] { $count } секунда
    [few] { $count } секунды
   *[many] { $count } секунд
}

months-count = { $count ->
    [one] { $count } месяц
    [few] { $count } месяца
   *[many] { $count } месяцев
}

time-expired = Время истекло
time-forever = Навсегда 👑

# Встраиваем логику прямо сюда, без ссылок на другие ключи
notification-expiration-warning = 🔔 <b>Напоминание</b>

    Срок аренды вашего UserBot'а <b>{ $name }</b> истекает через <b>{ $days ->
        [one] { $days } день
        [few] { $days } дня
       *[many] { $days } дней
    }</b>.

    Не забудьте продлить его в меню 'Мои UserBot', чтобы не потерять данные.

notification-admin-time-changed = ⏳ Администратор изменил время работы вашего UserBot'а <b>{ $name }</b>.

    { $days ->
        [0] Время не изменилось.
       *[other] Добавлено: <b>{ $days ->
            [one] { $days } день
            [few] { $days } дня
           *[many] { $days } дней
       }</b>
    }

notification-admin-gave-container = 🎉 Администратор <b>{ $admin }</b> выдал вам новый UserBot!

    <b>Имя:</b> <code>{ $container }</code>
    <b>Срок:</b> { $days ->
        [one] { $days } день
        [few] { $days } дня
       *[many] { $days } дней
    }

    Вы можете найти его в разделе 'Мои UserBot'.

extend-plan-button = { $months ->
    [one] { $months } месяц
    [few] { $months } месяца
   *[many] { $months } месяцев
} за { $price }₽ { $discount }

free-tariff-label = Бесплатно (2 дня)
