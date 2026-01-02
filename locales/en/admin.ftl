admin-user-profile = <b>Profile:</b> { $name } ({ $username })
    <b>ID:</b> <code>{ $id }</code>
    <b>Status:</b> { $status }
    <b>Role:</b> { $role }

    <b>Balance:</b> { $balance } RUB
    <b>Ref. Balance:</b> { $ref_balance } RUB
    <b>Reg. Date:</b> { $reg_date }
    <b>Containers:</b> { $container_count }

admin-user-list-title = 👤 <b>User List</b> (Page { $page }/{ $total })

    Select a user or use search.

admin-user-status-blocked = BLOCKED 🚫
admin-user-status-active = Active ✅

# --- Dashboard & Menus ---
admin-dashboard-header = 👑 <b>ADMIN CONSOLE</b> <code>v{ $version }</code>
    🕒 { $date } | { $status } { $raid }

    📊 <b>Live Stats:</b>
    👥 Users: <b>{ $users }</b>
    🐳 Containers: <b>{ $containers }</b> (active)
    💰 Revenue (24h): <b>{ $revenue } RUB</b>
    🎫 Tickets: <b>{ $tickets }</b> pending

    👇 <b>Select module:</b>

admin-menu-management-desc = 👥 <b>Resource Management</b>

    Manage users, containers, and subscriptions.
    Use search for quick actions.

admin-menu-system-desc = ⚙️ <b>System Core</b>

    Node management, global settings, logs, and diagnostics.

admin-menu-marketing-desc = 📢 <b>Marketing & Comms</b>

    • Mass broadcasts
    • Channel news
    • Promo codes

admin-menu-servers-desc = 🕹️ <b>Server Management</b>

    Add, delete, edit, and toggle servers here.

# --- Server Wizard ---
server-wizard-step1 = <b>Step 1/4:</b> Enter Server ID (latin, no spaces).
    Example: <code>de-7</code>
server-wizard-step2 = <b>Step 2/4:</b> Enter Display Name (with flag).
    Example: <code>DE-7 🇩🇪 (Fast)</code>
server-wizard-step3 = <b>Step 3/4:</b> Enter Server IP.
    Example: <code>192.168.1.1</code>
server-wizard-step4 = <b>Step 4/4:</b> Enter Root Password.
    <i>(Message will be deleted after processing)</i>
server-wizard-adding = ⏳ Adding server to DB and updating cache...
server-wizard-error-id-exists = ❌ Server with this ID already exists.
server-wizard-error-invalid-id = ❌ Invalid ID format. Use latin letters, numbers, and hyphens.

# --- Server Management Actions ---
admin-server-toggled = 🔌 Server <b>{ $name }</b> ({ $id }) is now <b>{ $status }</b>.
admin-server-added = ✅ Server <b>{ $name }</b> successfully added!
admin-server-deleted = 🗑️ Server <b>{ $name }</b> deleted.
admin-server-updated = 📝 Server <b>{ $name }</b> updated.
admin-server-status-on = ONLINE 🟢
admin-server-status-off = OFFLINE 🔴
admin-server-log-title = 🕹 <b>SERVER STATUS CHANGE</b>

server_add = ➕ Add
server_edit = ✏️ Edit
server_delete = 🗑 Delete
server_delete_confirm = 🔥 Yes, delete forever
server_edit_name = Name
server_edit_ip = IP Address
server_edit_pass = Password (Root)
server_edit_port = SSH Port
server_back_select = ⬅️ Back to list

# --- User Edit Actions ---
admin-user-blocked-alert = 🚫 User blocked.
admin-user-unblocked-alert = ✅ User unblocked.
admin-user-role-changed-alert = 👑 Role changed to «{ $role }».
admin-user-balance-changed-alert = 💰 Balance changed by { $amount } RUB.

notification-user-blocked = ⛔️ <b>Your account has been blocked by an administrator.</b>
notification-user-unblocked = ✅ <b>Your account has been unblocked.</b>
notification-admin-balance-changed = 💰 An administrator changed your balance by <b>{ $amount } RUB</b>.
    Current balance: <b>{ $balance } RUB</b>.

notification-admin-role-changed = 👑 An administrator assigned you the role: <b>{ $role }</b>.

admin-user-deleted-success = ✅ User <b>{ $id }</b> and all their data have been permanently deleted.

# --- Promo & Marketing ---
promo_management_title = 🎁 <b>Promo Code Management</b>
    Select promo type to force push to channel.

promo-type-free-container = 📦 Free Container
promo-type-money-bonus = 💵 Money Bonus
promo-type-deposit-bonus = 💰 Deposit Bonus
promo-type-discount-bonus = 📉 Discount
promo-type-game-check = 🎫 Game Check

news_button_title = 📢 News
mailing_button = 📬 Broadcast
promo_management_button = 🎁 Promo Codes

broadcast_confirmation_title = 📢 <b>Broadcast Preview</b>
broadcast_preview_label = <i>(User view)</i>
broadcast_prompt_text = 📝 <b>Enter broadcast text:</b>
    HTML allowed.
broadcast_prompt_media_q = 📸 <b>Add media?</b>
broadcast_prompt_media_send = 📤 <b>Send photo or video:</b>
broadcast_prompt_button_q = 🔗 <b>Add link button?</b>
broadcast_prompt_button_text = 🔤 <b>Enter button text:</b>
broadcast_prompt_button_url = 🔗 <b>Enter link (URL):</b>
broadcast_invalid_url = ❌ Invalid URL. Must start with http:// or https://
broadcast_start_message = 🚀 <b>Broadcast started!</b>
broadcast_progress_update = ⏳ Sent: { $sent } / { $total }
broadcast_finish_message = ✅ <b>Broadcast finished!</b>
    📨 Delivered: { $sent }
    ❌ Failed: { $failed }
send_broadcast_button = 🚀 Send to All

news_prompt_text = 📢 <b>Enter news text for channel:</b>
news_skip_button = ⏩ Skip
news_prompt_media = 📸 <b>Send media (Photo/Video)</b> or skip:
news_prompt_buttons = 🔗 <b>Buttons (URL)</b>
    Format: <code>Text | Link</code>
    One per line.
news_preview_header = 👁 <b>Preview:</b>
news_send_confirm = ✅ Publish
news_sent_success = ✅ News published!

marketing-broadcast-confirm = Confirm broadcast?
marketing-broadcast-no-users = ❌ No users found for broadcast.
marketing-broadcast-preview = 👁 <b>Preview:</b>
marketing-news-media-error = ⚠️ Please send a photo/video or skip.
marketing-news-buttons-error = ⚠️ Failed to parse buttons. Format: <code>Text | Link</code>.
marketing-news-confirm = Confirm posting to channel?
marketing-promo-published = ✅ Promo code successfully published.

# --- Settings ---
bot_settings_title = ⚙️ <b>Bot Settings</b>
    Current system state.

toggle_maintenance_on = 🔴 Enable Maintenance
toggle_maintenance_off = 🟢 Disable Maintenance
maintenance_mode_on = ENABLED (Access Closed)
maintenance_mode_off = DISABLED (Working)

toggle_raid_on = 🛡 Enable Raid Mode
toggle_raid_off = 🛡 Disable Raid Mode
raid_mode_on = ACTIVE 🚨
raid_mode_off = INACTIVE 💤

clear_cache_button = 🧹 Clear Cache
restart_bot_button = 🤖 Restart Bot
current_status_label = Maint. Status:
current_raid_status_label = Raid Status:

restart_confirmation_text = ⚠️ <b>Are you sure you want to restart the bot?</b>
    All active processes will be interrupted.
restart_initiated_alert = ✅ Restart command sent.
cache_cleared_notification = 🧹 Cache cleared successfully.

# --- System Control ---
system-maintenance-toggled = 🔧 Maintenance Mode: <b>{ $status }</b>
system-raid-toggled = 🛡 Raid Control: <b>{ $status }</b>
system-restart-confirmation = ⚠️ <b>Are you sure you want to restart the bot?</b>
    All active processes will be interrupted.
system-restart-success = ✅ Restart command sent.
system-cache-cleared = 🧹 Cache cleared successfully.
system-roles-info = ℹ️ <b>Role Information:</b>
    
    👑 <b>OWNER</b> - Full access.
    🧢 <b>CO_OWNER</b> - Server management, terminal.
    ⭐️ <b>SENIOR_ADMIN</b> - Finance, container issuance.
    🛡 <b>ADMIN</b> - Bans, user view.
    👤 <b>USER</b> - Regular user.

# --- New Year ---
admin-gift-confirm = 🎄 <b>NEW YEAR GIFT</b>

    You are about to issue <b>{ $amount } RUB</b> to ALL users.

    👤 Total Users: { $count }
    💰 Total Cost: ~{ $total } RUB

    <b>Confirm?</b>

admin-gift-started = 🚀 <b>Gifts are on their way!</b>
    Balances updated. Notifications broadcast started in background.

notification-new-year-gift = 🎄 <b>HAPPY NEW YEAR!</b> 🎅

    RewHost team wishes you happy holidays!
    Thank you for being with us.

    🎁 <b>You received:</b> { $amount } RUB

    <i>May your containers always be online! ❄️</i>

# --- Support ---
admin-support-menu-text = 📨 <b>Support</b>

    Use the web interface to manage tickets.
    It supports real-time chat and easy management.

admin-open-tickets-btn = 📨 Open Ticket Panel
