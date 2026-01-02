days-count = { $count ->
    [one] { $count } день
    [few] { $count } дні
   *[many] { $count } днів
}

hours-count = { $count ->
    [one] { $count } година
    [few] { $count } години
   *[many] { $count } годин
}

minutes-count = { $count ->
    [one] { $count } хвилина
    [few] { $count } хвилини
   *[many] { $count } хвилин
}

seconds-count = { $count ->
    [one] { $count } секунда
    [few] { $count } секунди
   *[many] { $count } секунд
}

months-count = { $count ->
    [one] { $count } місяць
    [few] { $count } місяці
   *[many] { $count } місяців
}

time-expired = Час вийшов
time-forever = Назавжди 👑

notification-expiration-warning = 🔔 <b>Нагадування</b>

    Термін оренди вашого UserBot'а <b>{ $name }</b> закінчується через <b>{ $days ->
        [one] { $days } день
        [few] { $days } дні
       *[many] { $days } днів
    }</b>.

    Не забудьте продовжити його в меню 'Мои UserBot', щоб не втратити дані.

notification-admin-time-changed = ⏳ Адміністратор змінив час роботи вашого UserBot'а <b>{ $name }</b>.

    { $days ->
        [0] Час не змінився.
       *[other] Додано: <b>{ $days ->
            [one] { $days } день
            [few] { $days } дні
           *[many] { $days } днів
       }</b>
    }

notification-admin-gave-container = 🎉 Адміністратор <b>{ $admin }</b> видав вам новий UserBot!

    <b>Ім'я:</b> <code>{ $container }</code>
    <b>Термін:</b> { $days ->
        [one] { $days } день
        [few] { $days } дні
       *[many] { $days } днів
    }

    Ви можете знайти його в розділі 'Мои UserBot'.

extend-plan-button = { $months ->
    [one] { $months } місяць
    [few] { $months } місяці
   *[many] { $months } місяців
} за { $price }₽ { $discount }

free-tariff-label = Безкоштовно (2 дні)
