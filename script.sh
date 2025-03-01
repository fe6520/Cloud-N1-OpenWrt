#!/bin/bash
#ABC
cd openwrt
# wireless
#rm -rf files/etc/config/wireless
#rm -rf files/etc/modules.d/wireless_enable
# Add luci-app-openclash
git clone https://github.com/vernesong/OpenClash.git package-temp
mv -f package-temp/luci-app-openclash package/lean/
rm -rf package-temp
# Add luci-theme-opentomcat
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git theme-temp/luci-theme-opentomcat
rm -rf theme-temp/luci-theme-opentomcat/LICENSE
rm -rf theme-temp/luci-theme-opentomcat/README.md
mv -f theme-temp/luci-theme-opentomcat package/lean/
rm -rf theme-temp
echo "src-git small https://github.com/kenzok8/small" > feeds.conf.default
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" > feeds.conf.default
git clone https://github.com/fe6520/OpenAppFilter.git package/luci-app-oaf
default_theme='opentomcat'
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci
# Add luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package-temp/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package-temp/luci-app-vssr
git clone https://github.com/kenzok8/small.git package-temp/small
cp -r package-temp/small/* package/lean/
mv -f package-temp/lua-maxminddb package/lean/
mv -f package-temp/luci-app-vssr package/lean/
rm -rf package-temp
