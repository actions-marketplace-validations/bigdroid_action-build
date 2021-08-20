use std::array::rename;

function todo() {
	local _new_meta="$1";
	local _prev_meta="$2";
	readonly _new_meta _prev_meta;

	### Parse HOOKS array
	## Current/new meta
	source "$_new_meta";
	array::rename "HOOKS" "HOOKS_NEW";

	## Previous/old meta
	source "$_prev_meta";
	array::rename "HOOKS" "HOOKS_PREV";

	local _hook;
	echo "Printing HOOKS_NEW";
	for _hook in "${HOOKS_NEW[@]}"; do {
		echo "HOOKS_NEW: $_hook";
	} done
	unset _hook;

	echo "Printing HOOKS_PREV";
	for _hook in "${HOOKS_PREV[@]}"; do {
		echo "HOOKS_PREV: $_hook";
	} done
	unset _hook;
}

function main() {
	curl --proto '=https' --tlsv1.2 -sSfL "https://git.io/Jc9bH" | bash -s selfinstall;
	source ~/.bashbox/env;
	bashbox install --force bigdroid;
	bigdroid build --release;

	local _head_tag;
	_head_tag="$(git -C "." name-rev --tags --name-only HEAD)";
	source Bigdroid.meta;
	git auth login --with-token <<<"$API_GITHUB_TOKEN";
	gh release create --draft "$_head_tag" "target/release/${CODENAME}-${VERSION}.iso#${NAME} $_head_tag";
}