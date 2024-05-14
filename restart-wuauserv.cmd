net stop bits

net stop wuauserv

net stop appidsvc

net stop cryptsvc

ren %systemroot%\SoftwareDistribution SoftwareDistribution.old

ren %systemroot%\system32\catroot2 catroot2.old

net start bits

net start wuauserv

net start appidsvc

net start cryptsvc

