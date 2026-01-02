days-count = { $count ->
    [one] { $count } day
   *[other] { $count } days
}

hours-count = { $count ->
    [one] { $count } hour
   *[other] { $count } hours
}

minutes-count = { $count ->
    [one] { $count } minute
   *[other] { $count } minutes
}

seconds-count = { $count ->
    [one] { $count } second
   *[other] { $count } seconds
}

months-count = { $count ->
    [one] { $count } month
   *[other] { $count } months
}

time-expired = Expired
time-forever = Forever 👑

notification-expiration-warning = 🔔 <b>Reminder</b>

    Subscription for your UserBot <b>{ $name }</b> expires in <b>{ $days ->
        [one] { $days } day
       *[other] { $days } days
    }</b>.

    Don't forget to extend it in 'My UserBots' menu to avoid data loss.

notification-admin-time-changed = ⏳ An administrator changed the runtime of your UserBot <b>{ $name }</b>.

    { $days ->
        [0] Time unchanged.
       *[other] Added: <b>{ $days ->
            [one] { $days } day
           *[other] { $days } days
       }</b>
    }

notification-admin-gave-container = 🎉 Administrator <b>{ $admin }</b> issued you a new UserBot!

    <b>Name:</b> <code>{ $container }</code>
    <b>Duration:</b> { $days ->
        [one] { $days } day
       *[other] { $days } days
    }

    You can find it in 'My UserBots' section.

extend-plan-button = { $months ->
    [one] { $months } month
   *[other] { $months } months
} for { $price }₽ { $discount }

free-tariff-label = Free (2 days)
