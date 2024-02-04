---
draft: false
authors:
  - sotig 
date: 2024-02-03 
categories:
  - Dev Ops
links:
  - plugins/search.md
  - insiders/index.md#how-to-become-a-sponsor
  - Nested section:
    - External link: https://example.com
    - setup/setting-up-site-search.md
tags:
  - Foo
  - Bar 
---

# ISP NAT bypass to expose home server to the web

## MY ISP
For years now my ISP does not allow me to [Port Forward](https://en.wikipedia.org/wiki/Port_forwarding) my server. Some years ago I wanted to host a game server. Then I noticed that whatever I did, I could not access my server from any outside network. After trying everything I could find on the Internet and double checking everything like firewall rule on the server and router, I came to the conclusion that my service provider is probably blocking port forwarding somehow. I later confirmed that in my country this is a common practice with some ISPs. 

I decided to contact my ISP to figure out what could be done to resolve my issue. After a very long call, traversing through support ranks, arguing and verbal fighting they said that they would resolve the issue and port forwarding will be available.

I was very happy that I could finally have my server up, even though I had to fight support. And things were fine for the next year, but as you can imagine this didn't last long.

It happened again. My server was inaccessible and I had to contact my ISP one more time. However, this presented a challenge for me. I wanted to see if there was anything that could be done to bypass all this and have things work without worrying about what my ISP decides their network will look like.

