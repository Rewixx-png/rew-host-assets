user-profile-header = 👤 <b>USER DASHBOARD</b>
    ──────────────────
    🆔 <b>ID:</b> <code>{ $user_id }</code>
    👑 <b>Role:</b> { $role }

user-profile-progress = 📊 <b>PROGRESS</b>
    <b>Lvl { $level }</b> <code>{ $progress_bar }</code> <b>{ $progress_percent }%</b>
    <i>XP: { $xp }/{ $next_xp }</i>

user-profile-finance = 💰 <b>FINANCE</b>
    ├ <b>Main:</b> { $balance } RUB
    ├ <b>Ref:</b>  { $ref_balance } RUB
    └ <b>Checks:</b> { $checks } pcs.

user-profile-activity = 🤖 <b>ACTIVITY</b>
    ├ <b>Bots:</b>  { $bots_count }
    └ <b>Reg:</b>    { $reg_date }

bonuses-header =

    <b>🎁 ACTIVE BONUSES</b>

bonus-row-discount =
    📉 Discount: <b>{ $percent }%</b>
bonus-row-deposit =
    💰 Deposit: <b>+{ $percent }%</b>
bonus-row-free-cont =
    📦 Free Bot: <b>Yes</b>
