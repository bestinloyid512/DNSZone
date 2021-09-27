#! /bin/bash
domain=$1
if [ "$1" == "-h" ] ; then
    echo "Usage: ./dnszone.sh domain.com"
    echo "example:./dnszone.sh zonetransfer.me"
    exit 0
fi
zone()
{
ns=$(dig +noall +answer NS $domain | awk '{print $5}')
for server in $ns
do
  dig @$server AXFR $domain
done
}
zone

