#!/bin/bash
PS3='choose new Rom or existing Rom: '
option=("NEW ROM" "EXISTING ROM")
select opt in "${option[@]}"; do
    case $opt in
        "NEW ROM")
        	cd /mnt/5724ff01-708b-465a-ac85-2fd8b8320a04/roms/
   		echo "making dir"
   		echo
   		echo "choose Rom NAME"
   		read rom
   		mkdir $rom
   		echo "dir made"
   		cd $rom
   		echo
   		echo "insert repo url with branch command"
   		read init
   		echo
   		repo init --depth=1 -u $init
   		echo
   		echo "init finished"
   		echo
   		echo "repo syncing"
   		echo
   		PS3='choose -J Value: '
   		jvalue=("j8" "j12" "j16" "else")
   		select jv in "${jvalue[@]}"; do
   			case $jv in
   				"j8")
   				   repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j8
   				   ;;
   			       "j12")
   			           repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j12
   			           ;;
   			       "j16")
   			           repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j16
   			           ;;
   			       "else")
   			       	   echo "-j value: " 
   			       	   read j
   				   repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$j
  				   ;;
  			esac
  		done
  		
  		echo
  		echo "repo sync done"
  		echo
        	
        	git clone https://github.com/arkmark99/android_device_oppo_CPH1859 -b twelve device/oppo/CPH1859
		echo
		echo "device_oppo_CPH1859 done"
		echo
		git clone https://github.com/Meghthedev/android_device_realme_mt6771-common device/realme/mt6771
		echo
		echo "android_device_realme_mt6771-common done"
		echo
		git clone https://github.com/CorvusRom-Devices/vendor_oppo_CPH1859 -b twelve vendor/oppo/CPH1859
		echo
		echo "vendor_oppo_CPH1859 done"
		echo
		git clone https://github.com/CorvusRom-Devices/kernel_realme_mt6771 kernel/realme/mt6771
		echo
		echo "kernel_realme_mt6771 done"
		echo
		git clone https://github.com/CorvusRom-Devices/device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr
		echo
		echo "device_mediatek_sepolicy_vndr done"
		echo
		git clone https://github.com/Meghthedev/clang-r353983c1.git prebuilts/clang/host/linux-x86/clang-r353983c1
		echo
		echo "clang-r353983c1.git done"
		echo
		cd frameworks/base
		wget https://raw.githubusercontent.com/sarthakroy2002/random-stuff/main/Patches/Fix-brightness-slider-curve-for-some-devices-a12l.patch
		patch -p1 < *.patch
		cd -
		echo
		echo "Linear brightness fix done"

		old="aosp"

		echo
		echo "enter rom name"
		read new

		echo
		echo "EDITED AndroidProducts.mk"
		sed -i "s/$old/$new/g" device/oppo/CPH1859/AndroidProducts.mk

		echo
		echo "EDOTED name_CPH1859.mk"
		sed -i "s/$old/$new/g" device/oppo/CPH1859/${old}_CPH1859.mk

		echo
		echo "RENAMEDD name_CPH1859.mk"
		mv device/oppo/CPH1859/${old}_CPH1859.mk device/oppo/CPH1859/${new}_CPH1859.mk

		echo
		echo "RENAMEDD name.dependencies.mk"
		mv device/oppo/CPH1859/${old}.dependencies device/oppo/CPH1859/${new}.dependencies
		echo
        	
        	echo
   		echo "type launch/build command"
   		read build
   		$build
   		echo
		echo "DONE"
   		;;
	"EXISTING ROM")
		cd /mnt/5724ff01-708b-465a-ac85-2fd8b8320a04/roms/
   		echo "changing dir"
   		ls
   		echo
   		echo "choose Rom"
   		read rom
   		cd ${rom}
   		. build/envsetup.sh
   		echo
   		echo "type launch/build command"
   		read build
   		$build
   		echo
		echo "DONE"
		;;
	esac
done


