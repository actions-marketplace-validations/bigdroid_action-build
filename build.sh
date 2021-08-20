function bashbox_after_build() {
	rsync -a "$_target_workfile" "$_arg_path/$CODENAME";
	chmod +x "$_arg_path/$CODENAME";
}
