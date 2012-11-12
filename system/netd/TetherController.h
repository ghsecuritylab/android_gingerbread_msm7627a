/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _TETHER_CONTROLLER_H
#define _TETHER_CONTROLLER_H

#include <linux/in.h>

#include <utils/List.h>

typedef android::List<char *> InterfaceCollection;
typedef android::List<struct in_addr> NetAddressCollection;

class TetherController {
    InterfaceCollection  *mInterfaces;
    NetAddressCollection *mDnsForwarders;
    pid_t                 mDaemonPid;
    int                   mDaemonFd;
    pid_t                 mRtrAdvPid; // IPv6 support
    InterfaceCollection  *mUpstreamInterfaces;

public:
    TetherController();
    virtual ~TetherController();

    int setIpFwdEnabled(bool enable);
    bool getIpFwdEnabled();

    int startTethering(int num_addrs, struct in_addr* addrs);

    int stopTethering();
    bool isTetheringStarted();

    int setDnsForwarders(char **servers, int numServers);
    NetAddressCollection *getDnsForwarders();

    int tetherInterface(const char *interface);
    int untetherInterface(const char *interface);
    InterfaceCollection *getTetheredInterfaceList();
    int startV6RtrAdv(int num_ifaces, char **ifaces);
    int stopV6RtrAdv();
    bool isV6RtrAdvStarted();
    int addV6RtrAdvIface(const char *iface);
    int removeV6RtrAdvIface(const char *iface);
    int addUpstreamInterface(char *iface);
    int removeUpstreamInterface(char *iface);
};

#endif