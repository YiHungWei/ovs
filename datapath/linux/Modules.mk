openvswitch_sources += \
	linux/compat/dev-openvswitch.c \
	linux/compat/dst_cache.c \
	linux/compat/exthdrs_core.c \
	linux/compat/geneve.c \
	linux/compat/gre.c \
	linux/compat/gso.c \
	linux/compat/genetlink-openvswitch.c \
	linux/compat/inet_fragment.c \
	linux/compat/ip_gre.c \
	linux/compat/ip_fragment.c \
	linux/compat/ip_output.c \
	linux/compat/ip_tunnel.c \
	linux/compat/ip_tunnels_core.c \
	linux/compat/ip6_output.c \
	linux/compat/ip6_gre.c \
	linux/compat/ip6_tunnel.c \
	linux/compat/lisp.c \
	linux/compat/netdevice.c \
	linux/compat/nf_conncount.c \
	linux/compat/nf_conntrack_core.c \
	linux/compat/nf_conntrack_proto.c \
	linux/compat/nf_conntrack_reasm.c \
	linux/compat/nf_conntrack_timeout.c \
	linux/compat/reciprocal_div.c \
	linux/compat/skbuff-openvswitch.c \
	linux/compat/socket.c \
	linux/compat/stt.c \
	linux/compat/udp.c \
	linux/compat/udp_tunnel.c \
	linux/compat/vxlan.c	\
	linux/compat/utils.c
openvswitch_headers += \
	linux/compat/gso.h \
	linux/compat/include/linux/percpu.h \
	linux/compat/include/linux/bug.h \
	linux/compat/include/linux/cache.h \
	linux/compat/include/linux/compiler.h \
	linux/compat/include/linux/compiler-gcc.h \
	linux/compat/include/linux/cpumask.h \
	linux/compat/include/linux/err.h \
	linux/compat/include/linux/etherdevice.h \
	linux/compat/include/linux/genetlink.h \
	linux/compat/include/linux/if.h \
	linux/compat/include/linux/if_ether.h \
	linux/compat/include/linux/if_link.h \
	linux/compat/include/linux/if_vlan.h \
	linux/compat/include/linux/in.h \
	linux/compat/include/linux/jiffies.h \
	linux/compat/include/linux/kconfig.h \
	linux/compat/include/linux/kernel.h \
	linux/compat/include/net/lisp.h \
	linux/compat/include/linux/list.h \
	linux/compat/include/linux/mpls.h \
	linux/compat/include/linux/net.h \
	linux/compat/include/linux/random.h \
	linux/compat/include/linux/netdevice.h \
	linux/compat/include/linux/netdev_features.h \
	linux/compat/include/linux/netfilter_ipv6.h \
	linux/compat/include/linux/netlink.h \
	linux/compat/include/linux/openvswitch.h \
	linux/compat/include/linux/rculist.h \
	linux/compat/include/linux/rcupdate.h \
	linux/compat/include/linux/reciprocal_div.h \
	linux/compat/include/linux/rtnetlink.h \
	linux/compat/include/linux/skbuff.h \
	linux/compat/include/linux/static_key.h \
	linux/compat/include/linux/stddef.h \
	linux/compat/include/linux/types.h \
	linux/compat/include/linux/u64_stats_sync.h \
	linux/compat/include/linux/udp.h \
	linux/compat/include/linux/workqueue.h \
	linux/compat/include/linux/timekeeping.h \
	linux/compat/include/net/checksum.h \
	linux/compat/include/net/dst.h \
	linux/compat/include/net/dst_cache.h \
	linux/compat/include/net/dst_metadata.h \
	linux/compat/include/net/genetlink.h \
	linux/compat/include/net/geneve.h \
	linux/compat/include/net/gre.h \
	linux/compat/include/net/inet_ecn.h \
	linux/compat/include/net/inet_frag.h \
	linux/compat/include/net/inetpeer.h \
	linux/compat/include/net/ip.h \
	linux/compat/include/net/ip_tunnels.h \
        linux/compat/include/net/ip6_fib.h \
	linux/compat/include/net/ip6_route.h \
	linux/compat/include/net/ip6_tunnel.h \
	linux/compat/include/net/ipv6.h \
	linux/compat/include/net/mpls.h \
	linux/compat/include/net/net_namespace.h \
	linux/compat/include/net/netlink.h \
	linux/compat/include/net/protocol.h \
	linux/compat/include/net/route.h \
	linux/compat/include/net/rtnetlink.h \
	linux/compat/include/net/udp.h \
	linux/compat/include/net/udp_tunnel.h \
	linux/compat/include/net/sock.h \
	linux/compat/include/net/stt.h \
	linux/compat/include/net/vrf.h \
	linux/compat/include/net/tun_proto.h \
	linux/compat/include/net/nsh.h \
	linux/compat/include/net/vxlan.h \
	linux/compat/include/net/netfilter/nf_conntrack.h \
	linux/compat/include/net/netfilter/nf_conntrack_core.h \
	linux/compat/include/net/netfilter/nf_conntrack_count.h \
	linux/compat/include/net/netfilter/nf_conntrack_expect.h \
	linux/compat/include/net/netfilter/nf_conntrack_helper.h \
	linux/compat/include/net/netfilter/nf_conntrack_labels.h \
	linux/compat/include/net/netfilter/nf_conntrack_seqadj.h \
	linux/compat/include/net/netfilter/nf_conntrack_timeout.h \
	linux/compat/include/net/netfilter/nf_conntrack_zones.h \
	linux/compat/include/net/netfilter/nf_nat.h \
	linux/compat/include/net/netfilter/ipv6/nf_defrag_ipv6.h \
	linux/compat/include/net/sctp/checksum.h \
	linux/compat/include/net/erspan.h \
	linux/compat/include/uapi/linux/netfilter.h
EXTRA_DIST += linux/compat/build-aux/export-check-whitelist
