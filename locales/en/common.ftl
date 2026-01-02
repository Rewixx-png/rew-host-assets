welcome-text = 🚀 <b>REWHOST SYSTEM</b>

    Hi, { $name }! 👋
    This is your personal userbot deployment base.

    ⚡️ <b>Fast. Stable. Simple.</b>

    Use the menu below to control 👇

welcome-text-new = 🚀 <b>REWHOST SYSTEM</b>

    Welcome to the family, { $name }!
    You found the best place for userbots.

    🎁 <b>YOUR STARTER PACK:</b>
    ├ <b>-10%</b> on first purchase
    └ <b>+15%</b> on first deposit

    Bonuses active. Let's go! 👇

misc-menu-caption = 🗂️ Additional functions and useful links are collected here.

status-check-text = 📊 To check the current server status, please visit our status page:

ping-response = 🏓 <b>Pong!</b>
    📡 API Latency: <code>{ $ms } ms</code>

help-header = 🛰 <b>RewHost Command Center</b>
    👤 <b>Your Access:</b> <code>{ $role }</code>

    Select a command category:

help-user = 👤 <b>USER:</b>

    🔹 <code>/start</code> — Main Menu / Restart
    🔹 <code>/top</code> — Leaderboard
    🔹 <code>/status</code> — Server Status
    🔹 <code>/ping</code> — Check Latency
    🔹 <code>/login</code> — Web Panel Link

    ℹ️ <i>All other functions are available via menu buttons.</i>

help-admin = 🛡 <b>ADMINISTRATOR:</b>

    🔸 <code>/admin</code> — Admin Panel
    🔸 <code>/stats</code> — Resource Analytics (Charts)
    🔸 <code>/ban [time] [reason]</code> — Ban (reply)
    🔸 <code>/unban</code> — Unban (reply)
    🔸 <code>/mute [time] [reason]</code> — Mute (reply)
    🔸 <code>/unmute</code> — Unmute (reply)
    🔸 <code>/kick</code> — Kick user
    🔸 <code>/warn</code> / <code>/unwarn</code> — Warns
    🔸 <code>/raidcheck</code> — Check user in DB (reply)
    🔸 <code>/cont check [ID]</code> — Inspect container
    🔸 <code>/cont delete [ID]</code> — <b>Delete</b> container
    🔸 <code>/cont logs [ID]</code> — Get logs
    🔸 <code>/cont [start|stop|block] [ID]</code> — Actions

help-senior = 👑 <b>SENIOR MANAGEMENT:</b>

    💠 <code>/give cont</code> — Issue container (reply)
    💠 <code>/give money [amount]</code> — Issue balance
    💠 <code>/give rmoney [amount]</code> — Issue ref. balance
    💠 <code>/give check [count]</code> — Issue game checks
    💠 <code>/admin [lvl] [prefix]</code> — Appoint chat admin
    💠 <code>/unadmin</code> — Demote chat admin
    💠 <code>/rinfo</code> — Full user dossier (reply)
    💠 <code>/report</code> — Force server report
    💠 <code>/session</code> — Find containers without sessions
    💠 <code>/purge_chat</code> — Chat purge instructions

help-system = ⚡️ <b>SYSTEM CORE:</b>

    ☢️ <code>/migration</code> — Migration from offline nodes
    ☢️ <code>/htop</code> — Resource Monitoring (GUI)
    ☢️ <code>/dstats</code> — Docker Stats (GUI)
    ☢️ <code>/drestart</code> — Smooth Node Restart
    ☢️ <code>/restart</code> — Full Bot Restart
    ☢️ <code>/fixloop</code> — BootLoop Detection & Fix
    ☢️ <code>/checkcont</code> — Ghost Container Search
    ☢️ <code>/orphans</code> — Orphaned DB Records Search
    ☢️ <code>/zombie</code> — Zombie Process Cleanup
    ☢️ <code>/test_ssh [server]</code> — Test Node Connection
    ☢️ <code>/backup</code> — Database Backup

# Ping
ping-initial = 🏓 <b>Pong!</b>
ping-result = 🏓 <b>Pong!</b>
    📡 API Latency: <code>{ $ms } ms</code>

# Support Web App
support-moved-message = 👨‍💻 <b>Support Service</b>

    We have moved to a convenient Web Interface.
    Click the button below to create a ticket.

support-open-btn = 📨 Open Support

# Buttons
my_userbots_button = 🤖 My UserBots
tariffs_button = ⚡️ Buy / Tariffs
profile_button = 👤 Profile
deposit_button = 💳 Deposit
misc_menu_button = 🗂️ Menu
server_status_button = 📊 Server Status
settings_button = ⚙️ Settings
support_chat_button = 💬 Chat
support_account_button = 👨‍💻 Agent
admin_panel_button = 👑 Admin Panel
back_to_main_menu_button = 🏠 Main Menu
back_to_admin_panel_button = 🔙 Admin Panel
cancel_button = ❌ Cancel
confirm_button = ✅ Confirm
yes_button = ✅ Yes
no_button = ❌ No
no_back_button = ❌ No, back
refresh_button = 🔄 Refresh
back_button = Back

# Misc
unhandled_message = I don't understand this command. Please use menu buttons or restart with /start.
error_unhandled_notification = ⚙️ An unexpected error occurred.
error_insufficient_permissions = ⛔️ <b>Access Denied.</b>
    You do not have permission to execute this command.

# Creation Hub
hub_tariff_select = Tariffs
hub_image_select = Images
hub_manual_server = Server
hub_ready_create = ✅ Create
hub_not_ready = ⏳ Select options
confirm_creation_button = ✅ Let's Go!

# Moderation
admin_promote_usage = <b>Usage:</b> <code>/admin [level 1-3] [prefix]</code> (reply)
admin_level_invalid = ❌ Level must be 1, 2 or 3.
admin_promote_success = ✅ User { $user_link } promoted to Admin (Level { $level }).
    <b>Prefix:</b> { $prefix }
admin_promote_error_bot_rights = ❌ Bot lacks rights to promote admins.
admin_demote_error_other_admin = ❌ Cannot manage another administrator.
admin_demote_error_not_admin = ❌ User is not an administrator.
admin_demote_success = ✅ { $user_link } demoted to Participant.

moderation_error_admin = 🛡 Action not applicable to administrators.

kick_reason = { $user_link } was kicked from the chat.
ban_reason = { $user_link } was banned{ $time_text }.{ $reason_text }
unban_reason = { $user_link } was unbanned.
mute_reason = { $user_link } was muted for <b>{ $time_str }</b>.{ $reason_text }
unmute_reason = { $user_link } was unmuted.

moderation_unmute_button = 🔓 Unmute
moderation_unban_button = 🔓 Unban

warn_issued = ⚠️ { $user_link } received a warning ({ $warn_count }/3).
warn_limit_reached_ban = ⛔ { $user_link } banned for 3 warnings.
warn_removed = 🍀 Warning removed from { $user_link }. Remaining: { $warn_count }/3.
warn_user_has_no_warns = ℹ️ User { $user_link } has no warnings.

captcha_welcome_text = 👋 Welcome, { $user_mention }!
    Verify you are human to chat.
captcha_button = 🤖 I am not a robot

flood_mute_message = ⛔ <b>{ $user_link }</b> muted for <b>{ $time } min</b>.
    <b>Reason:</b> Flood / Spam.

    <i>Chat Protection System.</i>

user_blocked_notification = ⛔️ You have been blocked by an administrator.
