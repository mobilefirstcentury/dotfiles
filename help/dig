How to do reverse DNS lookup
Most people can better remember domain names, e.g., www.gnu.org, than their corresponding IP addresses, 199.232.41.10. (In this example, www.gnu.org is the home of the Free Software Foundation.) We delegate the responsibility to machines, aka, the DNS servers, to resolve the domain names for us.

Sometimes, we do need to manually lookup the IP address of a domain name. You may already be familiar with the nslookup command which is now deprecated. We use the dig command to make DNS queries.
 $ dig +noall +answer www.gnu.org
www.gnu.org.            67      IN      CNAME   gnu.org.
gnu.org.                67      IN      A       199.232.41.10


The IP address is displayed in the A record, and is 199.232.41.10.

The +noall, +answer combination basically tells dig to only report the answer of the DNS query and skip the rest of the output.

You can also use the dig command with the -x option to do a reverse DNS lookup. A reverse DNS lookup means you want to look up the domain and host name of an IP address.

 $ dig +noall +answer -x 199.232.41.10
10.41.232.199.in-addr.arpa. 36000 IN    CNAME   rev-c41-10.gnu.org.
rev-c41-10.gnu.org.       300     IN      PTR     www.gnu.org.


The PTR record is the one that contains the domain host name. The domain name is, as you expect, www.gnu.org.

Note that PTR records are not required for IP addresses. If a PTR record is not defined for an IP address, you cannot do a remote DNS lookup.
