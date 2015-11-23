#  IPFS has a very easy setup process, consisting of two basic steps. First, the download of
#  the latest version from gobuilder, extraction, and then placing the binary in the /usr/local/bin
#  directory. However, this only makes IPFS accessible from the local machine. For other devices
#  to be able to take advantage of the web interface and make IPFS browsing easy from any computer
#  on the LAN, additional steps are needed. The goal of this is to make setup of such a node as
#  simple as possible.

#  BUILT FOR CENTOS 7 x64

yum install -y wget
yum install -y unzip

wget https://gobuilder.me/get/github.com/ipfs/go-ipfs/cmd/ipfs/ipfs_master_linux-amd64.zip
unzip ipfs_master_linux-amd64.zip
rm -f ipfs_master_linux-amd64.zip
cp ipfs/ipfs /usr/local/bin/ipfs

firewall-cmd --zone=public --add-port=5001/tcp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
systemctl restart firewalld

ipfs init

ipfs daemon