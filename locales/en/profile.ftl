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

# --- Sessions ---
session_menu_title = 📝 <b>Session Management (String Session)</b>

    Here you can generate a session string for use in scripts or userbots.
    We support generation via the official Telegram API.

    👇 <b>Select an action:</b>

session_enter_api_id = 🔢 <b>Enter API ID</b>

    Get it at my.telegram.org.
    It must be a number.

session_invalid_api_id = ❌ Invalid API ID. Please enter a number.

session_enter_api_hash = 🔑 <b>Enter API HASH</b>

    Long string of letters and numbers.

session_enter_phone = 📱 <b>Enter Phone Number</b>

    In international format (e.g.: <code>+1234567890</code>).

session_sending_code = ⏳ Sending authorization code request to Telegram...

session_enter_code = 📩 <b>Enter Confirmation Code</b>

    The code you received in Telegram (or SMS).
    Example: <code>12345</code>

session_enter_password = 🔐 <b>Enter 2FA Password</b>

    Your account is protected by two-factor authentication.

session_enter_comment_prompt = 💬 <b>Enter Comment</b>

    Write a name for this session to remember (e.g.: "Main Acc").
    Or click "Skip".

session_generic_error = ❌ <b>Auth Error:</b>
    <code>{ $error }</code>
    Please try again.

session_success_title = ✅ <b>Session successfully created!</b>

session_saved_success = 💾 Session saved to your library.
session_string_is = 👇 <b>Your Session String (tap to copy):</b>
session_list_title = 📄 <b>Your saved sessions:</b>
session_no_saved_sessions = 📂 You have no saved sessions.
session_deleted_success = 🗑 Session deleted.
session_download_caption = 📥 File with your sessions (RewHost).
session_skip_comment_button = ⏩ Skip
