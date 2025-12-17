#!/bin/bash
set -e

log() {
    echo -e "\033[1;34m[RewHost Init]\033[0m $1"
}

if [ -n "$TARGET_VERSION" ]; then
    log "Target version detected: $TARGET_VERSION"
    
    if [ -d ".git" ]; then
        log "Fetching updates from remote..."
        git fetch --all --tags --force > /dev/null 2>&1
        
        log "Switching branch/tag to $TARGET_VERSION..."
        if git checkout "$TARGET_VERSION"; then
            log "Successfully switched to $TARGET_VERSION"
            
            if [ -f "requirements.txt" ]; then
                log "Updating dependencies..."
                pip3 install --no-cache-dir -r requirements.txt > /dev/null 2>&1 || log "Warning: Pip install failed, trying to continue..."
            fi
        else
            log "❌ Error: Could not checkout $TARGET_VERSION. Staying on current version."
        fi
    else
        log "❌ Error: Not a git repository. Cannot switch version."
    fi
else
    log "No specific version requested. Using current (latest/master)."
fi

log "Starting application..."
exec "$@"