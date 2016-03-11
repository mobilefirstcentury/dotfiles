---- DIG CHEATSHEET ----
========================

## Domain name'IP resolution (DNS Lookup) 
 # the ip is in the 'A' record of the DNS
 $ dig +noall +answer www.gnu.org     // request only the report of the DNS query and discards other ouput

## IP's Domain resolution (Reverse DNS Query)
 # the domain is in the 'PTR' record of the DNS
 # As PTR record are optional, if it's not set on the DNS, Reverse DNS Resolution is impossible
 $ dig +noall +answer -x 199.232.41.10

## Resolve my external ip  (myip)
  # [TODO] Should be aliased
  # resolver1.opendns.com has the magical "myip.opendns.com" url tied to the IP of whoever makes the request
  $ dig +short myip.opendns.com @resolver1.opendns.com
