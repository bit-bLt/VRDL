log() {
    tag="[null]"
    if [ $1 = 0 ]; then
        tag="[INFO]"
    fi
    if [ $1 = 1 ]; then
        tag="[WARN]"
    fi
    if [ $1 = 2 ]; then
        tag="[ERROR]"
    fi

    echo "$tag $2" >&2
 
    if [ $VRDL_LOG_FILE_ENABLE -eq 1 ]; then
        echo "$tag $2" >> "$VRDL_LOG_FILE"
    fi
}
