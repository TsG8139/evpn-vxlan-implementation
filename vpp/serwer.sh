#!/usr/bin/vppctl

create interface virtio 0000:00:04.0
set interface state virtio-0/0/4/0 up

create interface virtio 0000:00:05.0
set interface state virtio-0/0/5/0 up

create interface virtio 0000:00:06.0
set interface state virtio-0/0/6/0 up

create sub-interfaces virtio-0/0/4/0 10
create sub-interfaces virtio-0/0/4/0 20

set interface state virtio-0/0/4/0.10 up
set interface state virtio-0/0/4/0.20 up

set interface l2 tag-rewrite virtio-0/0/4/0.10 pop 1
set interface l2 tag-rewrite virtio-0/0/4/0.20 pop 1

set interface l2 bridge virtio-0/0/4/0.10 10
set interface l2 bridge virtio-0/0/4/0.20 20

set interface l2 bridge virtio-0/0/5/0 10
set interface l2 bridge virtio-0/0/6/0 20

set acl-plugin acl index 0 permit src ::/0 dst ::/0 proto 58, permit+reflect src ::/0 dst ::/0 proto 6 sport 0-65535 dport 22
set acl-plugin interface virtio-0/0/5/0 output acl 0