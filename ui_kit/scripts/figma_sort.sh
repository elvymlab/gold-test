ls ./*\.zip | xargs -I % sh -c "unzip -qoj '%'; rm '%'"
custom_name=""
while getopts 'f:' flag; do
	case "$flag" in
    f)
      custom_name="$OPTARG"
      ;;
    ?)
      echo "script usage: $(basename \$0) [-f somevalue]" >&2
      exit 1
      ;;
  esac
done
for file in *@2x*.{jpg,jpeg,png,svg}
do
	if [ -z "$custom_name" ]; then 
		new_name="${file//@2x/}"
	else
		new_name=$custom_name
	fi
	[ -f "$file" ] && mv "$file" "../assets/images/2.0x/$new_name"
done
for file in *@3x*.{jpg,jpeg,png,svg}
do
	if [ -z "$custom_name" ]; then 
		new_name="${file//@3x/}"
	else
		new_name=$custom_name
	fi
	[ -f "$file" ] && mv "$file" "../assets/images/3.0x/$new_name"
done
for file in *.{jpg,jpeg,png,svg}
do
	if [ -z "$custom_name" ]; then 
		new_name="$file"
	else
		new_name=$custom_name
	fi
	[ -f "$file" ] && mv "$file" "../assets/images/$new_name"
done
