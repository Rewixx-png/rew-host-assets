user-profile-header = 👤 <b>ЛИЧНЫЙ КАБИНЕТ</b>
    ──────────────────
    🆔 <b>ID:</b> <code>{ $user_id }</code>
    👑 <b>Статус:</b> { $role }

user-profile-progress = 📊 <b>ПРОГРЕСС</b>
    <b>Lvl { $level }</b> <code>{ $progress_bar }</code> <b>{ $progress_percent }%</b>
    <i>XP: { $xp }/{ $next_xp }</i>

user-profile-finance = 💰 <b>ФИНАНСЫ</b>
    ├ <b>Основа:</b> { $balance } ₽
    ├ <b>Реф:</b>    { $ref_balance } ₽
    └ <b>Чеки:</b>   { $checks } шт.

user-profile-activity = 🤖 <b>АКТИВНОСТЬ</b>
    ├ <b>Ботов:</b>  { $bots_count }
    └ <b>Рег:</b>    { $reg_date }

bonuses-header =

    <b>🎁 АКТИВНЫЕ БОНУСЫ</b>

bonus-row-discount =
    📉 Скидка: <b>{ $percent }%</b>
bonus-row-deposit =
    💰 Депозит: <b>+{ $percent }%</b>
bonus-row-free-cont =
    📦 Free Bot: <b>Да</b>
