# ... existing content ...
# Adding missing keys from code usage
status_frozen = ❄️ FROZEN
status_running = 🟢 RUNNING
status_exited = 🔴 STOPPED
status_restarting = 🟡 RESTARTING
status_not_found = ❓ NOT FOUND
status_error = ⚠️ ERROR
status_blocked = ⛔ BLOCKED

not_found_explanation =
    ⚠️ <b>Container not found on server!</b>
    It might have been deleted manually or an error occurred.
    Try "Reinstall" in settings.

container_stats_text =
    📊 <b>Monitoring:</b>
    { $cpu_stats }
    { $ram_stats }

cpu_status_normal = ✅ Normal
cpu_status_high = 🔥 High Load!
cpu_stats_format = CPU: { $usage }% / { $limit }% | { $status }

session_status_active = ✅ Session Active
session_status_not_found = ❌ Session Missing
session_status_error = ⚠️ Check Error

# --- Info Template ---
manage_userbot_info = 📦 <b>UserBot Management</b>
    ──────────────────
    🆔 <b>ID:</b> <code>{ $container_id }</code>
    🏷 <b>Name:</b> <code>{ $container_name }</code>
    🌍 <b>Server:</b> { $server_name }
    💳 <b>Tariff:</b> { $tariff_name } ({ $actual_ram_mb } MB)
    💿 <b>Image:</b> { $image_name }

    📊 <b>Status:</b> { $status_text }
    📡 <b>Session:</b> { $session_status_text }
    🔄 <b>Transfer:</b> { $transfer_status }
    ⏳ <b>Expires:</b> { $remaining_time }

transfer_status_pending = ⏳ Pending (Link Created)
transfer_status_active = ❌ Inactive

turn_on_button = ▶️ Start
turn_off_button = ⏹️ Stop
restart_button = 🔄 Restart
freeze_button = ❄️ Freeze
unfreeze_button = ☀️ Unfreeze

# --- Submenu Buttons ---
extend_button = ⏳ Extend
upgrade_cpu_button = ⚡️ Upgrade CPU
upgrade_ram_button = 🧠 Upgrade RAM
change_name_button = 📝 Rename
change_image_button = 🖼 Change Image
change_server_button = ⇄ Move
reinstall_button = ♻️ Reinstall
login_button = 🚪 Login (Web)
interactive_login_button = 💬 Interactive Login
get_logs_button = 📋 Logs
transfer_bot_button = 🎁 Transfer
delete_button = 🗑️ Delete
admin_change_time_button = ⏳ Change Time (Admin)
admin_change_server_button = ⇄ Change Server (Admin)

reinstall_confirm_text = ⚠️ <b>Are you sure?</b>
    All data will be permanently deleted.
    Container will be recreated from scratch.

free_action_note = This action is free.
install_button = Install

change_name_error_generic = ❌ Rename failed. Name might be taken or invalid.

# --- Change Server ---
change_server_prompt = 🌍 <b>Container Migration</b>
    Choose a server to move your bot to.
    <code>/user_data</code> will be preserved (unless image changed).
confirm_server_change_prompt = ⚠️ <b>Confirm Migration</b>
    Move container to <b>{ $server_name }</b>?
    Bot will be stopped during transfer.

# --- Transfer ---
transfer_confirm_text = 🎁 <b>Transfer Container</b>
    You are about to create a transfer link.
    Anyone with the link can claim ownership of this bot.
transfer_confirm_button = ✅ Create Link
transfer_link_message = 🔗 <b>Transfer link created!</b>
    Forward this message to the new owner.
    Link valid for 15 minutes.
transfer_canceled = ❌ Transfer canceled. Link revoked.
transfer_link_btn = ➡️ Transfer Link
transfer_cancel_btn = ❌ Cancel Transfer
transfer_free_error = ❌ Free containers cannot be transferred.
transfer_token_not_found = ❌ Link invalid or expired.
transfer_self_claim = ⚠️ You cannot transfer a container to yourself.
transfer_claim_success_new_owner = ✅ <b>Success!</b>
    You claimed container <b>{ $container_name }</b>.
transfer_claim_success_old_owner = 📤 <b>Container Transferred!</b>
    Your bot <b>{ $container_name }</b> was successfully transferred to <b>{ $new_owner_name }</b>.

# --- Delete ---
delete_confirm_step1_text = 🗑️ <b>Delete Container</b>
    Do you really want to delete this bot?
    This cannot be undone.
delete_agree_button = Yes, delete
delete_confirm_step2_text = ‼️ <b>FINAL WARNING</b>
    All data will be destroyed permanently.
    Sure?
delete_final_confirm_button = 🔥 DELETE FOREVER

# --- Orphans ---
orphans_not_found = ✅ No orphaned containers found.
orphans_found_text = ⚠️ <b>Orphaned records found ({ $count })!</b>
    These are containers whose servers were deleted.
orphans_delete_button = 🗑️ Delete All ({ $count })
orphans_confirm_deletion = Are you sure you want to delete these records from DB?
orphaned_container_warning = ⚠️ <b>WARNING: SERVER DELETED</b>
    Server <b>{ $server_name }</b> was removed from config.
    This container is no longer accessible.
    You can delete the record or migrate (admin only).

# --- Upgrade ---
upgrade_cpu_prompt = ⚡️ <b>CPU Upgrade</b>
    Current limit: <b>{ $current } cores</b>
    Choose amount to add:
upgrade_ram_prompt = 🧠 <b>RAM Upgrade</b>
    Current limit: <b>{ $current } MB</b>
    Choose amount to add:
extend_prompt = ⏳ <b>Extend Subscription</b>
    Choose duration.
    Longer period = bigger discount.
extend_cpu_surcharge_info = ℹ️ CPU Surcharge (+{ $cpu_percent }%): <b>{ $cpu_cost }₽/mo</b>
extend_ram_surcharge_info = ℹ️ RAM Surcharge ({ $actual_ram }MB): <b>{ $ram_cost }₽/mo</b>
extend_insufficient_funds = ❌ Insufficient funds.
    Total: <b>{ $cost }₽</b>
    Balance: <b>{ $balance }₽</b>
extend_success = ✅ Subscription extended!
extend_free_not_allowed = ❌ Free tariff cannot be extended.
