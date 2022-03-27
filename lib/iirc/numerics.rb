module IIRC
  # Definitions imported from ircdocs.horse
  # @version 1.63
  # @see https://raw.githubusercontent.com/ircdocs/irc-defs/gh-pages/_data/numerics.yaml
  # @see https://defs.ircdocs.horse/defs/numerics.html
  module Numerics
    # The first message sent after client registration. The text used varies widely
    # @format 001 <client> :Welcome to the Internet Relay Network <nick>!<user>@<host>
    RPL_WELCOME = :"001"
    # Part of the post-registration greeting. Text varies widely. Also known as RPL_YOURHOSTIS (InspIRCd v2)
    # @format 002 <client> :Your host is <servername>, running version <version>
    RPL_YOURHOST = :"002"
    # Part of the post-registration greeting. Text varies widely and <date> is returned in a human-readable format. Also known as RPL_SERVERCREATED (InspIRCd v2)
    # @format 003 <client> :This server was created <date>
    RPL_CREATED = :"003"
    # Part of the post-registration greeting. Also known as RPL_SERVERVERSION (InspIRCd v2)
    # @format 004 <client> <server_name> <version> <usermodes> <chanmodes> [chanmodes_with_a_parameter]
    RPL_MYINFO = :"004"
    # Advertises features, limits, and protocol options that clients should be aware of. Also known as RPL_PROTOCTL (Bahamut, Unreal, Ultimate)
    # @format 005 <client> <1-13 tokens> :are supported by this server
    RPL_ISUPPORT = :"005"
    RPL_MAP_UNREAL = :"006"
    # Also known as RPL_ENDMAP (InspIRCd)
    RPL_MAPEND_UNREAL = :"007"
    # Server notice mask (hex). Also known as RPL_SNOMASKIS (InspIRCd)
    RPL_SNOMASK = :"008"
    RPL_STATMEMTOT = :"009"
    # Sent to the client to redirect it to another server. Also known as RPL_REDIR
    # @format 010 <client> <hostname> <port> :<info>
    RPL_BOUNCE = :"010"
    RPL_YOURCOOKIE = :"014"
    RPL_MAP_IRCU = :"015"
    RPL_MAPMORE_IRCU = :"016"
    # Also known as RPL_ENDMAP (InspIRCd)
    RPL_MAPEND_IRCU = :"017"
    # @format 018 <client> :<count> servers and <count> users, average <average count> users per server
    RPL_MAPUSERS = :"018"
    # Used by Rusnet to send the initial "Please wait while we process your connection" message, rather than a server-sent NOTICE.
    # @format 020 <client> :<info>
    RPL_HELLO = :"020"
    RPL_APASSWARN_SET = :"030"
    RPL_APASSWARN_SECRET = :"031"
    RPL_APASSWARN_CLEAR = :"032"
    # Also known as RPL_YOURUUID (InspIRCd)
    RPL_YOURID = :"042"
    # Sent to the client when their nickname was forced to change due to a collision
    # @format 043 <client> <newnick> :<info>
    RPL_SAVENICK = :"043"
    RPL_ATTEMPTINGJUNC = :"050"
    RPL_ATTEMPTINGREROUTE = :"051"
    # Same format as RPL_ISUPPORT, but returned when the client is requesting information from a remote server instead of the server it is currently connected to
    RPL_REMOTEISUPPORT = :"105"
    # See RFC
    # @format 200 <client> Link <version>[.<debug_level>] <destination> <next_server> [V<protocol_version> <link_uptime_in_seconds> <backstream_sendq> <upstream_sendq>]
    RPL_TRACELINK = :"200"
    # See RFC
    # @format 201 <client> Try. <class> <server>
    RPL_TRACECONNECTING = :"201"
    # See RFC
    # @format 202 <client> H.S. <class> <server>
    RPL_TRACEHANDSHAKE = :"202"
    # See RFC
    # @format 203 <client> ???? <class> [<connection_address>]
    RPL_TRACEUNKNOWN = :"203"
    # See RFC
    # @format 204 <client> Oper <class> <nick>
    RPL_TRACEOPERATOR = :"204"
    # See RFC
    # @format 205 <client> User <class> <nick>
    RPL_TRACEUSER = :"205"
    # See RFC
    # @format 206 <client> Serv <class> <int>S <int>C <server> <nick!user|*!*>@<host|server> [V<protocol_version>]
    RPL_TRACESERVER = :"206"
    # See RFC
    # @format 207 <client> Service <class> <name> <type> <active_type>
    RPL_TRACESERVICE = :"207"
    # See RFC
    # @format 208 <client> <newtype> 0 <client_name>
    RPL_TRACENEWTYPE = :"208"
    # See RFC
    # @format 209 <client> Class <class> <count>
    RPL_TRACECLASS = :"209"
    # Used instead of having multiple stats numerics
    RPL_STATS = :"210"
    # Used to send lists of stats flags and other help information.
    RPL_STATSHELP = :"210"
    # Reply to STATS (See RFC)
    # @format 211 <client> <linkname> <sendq> <sent_msgs> <sent_bytes> <recvd_msgs> <rcvd_bytes> <time_open>
    RPL_STATSLINKINFO = :"211"
    # Reply to STATS (See RFC)
    # @format 212 <client> <command> <count> [<byte_count> <remote_count>]
    RPL_STATSCOMMANDS = :"212"
    # Reply to STATS (See RFC)
    # @format 213 <client> C <host> * <name> <port> <class>
    RPL_STATSCLINE = :"213"
    # Reply to STATS (See RFC), Also known as RPL_STATSOLDNLINE (ircu, Unreal)
    # @format 214 <client> N <host> * <name> <port> <class>
    RPL_STATSNLINE_RFC1459 = :"214"
    # Reply to STATS (See RFC)
    # @format 215 <client> I <host> * <host> <port> <class>
    RPL_STATSILINE = :"215"
    # Reply to STATS (See RFC)
    # @format 216 <client> K <host> * <username> <port> <class>
    RPL_STATSKLINE = :"216"
    RPL_STATSQLINE_RFC1459 = :"217"
    RPL_STATSPLINE_IRCU = :"217"
    # Reply to STATS (See RFC)
    # @format 218 <client> Y <class> <ping_freq> <connect_freq> <max_sendq>
    RPL_STATSYLINE = :"218"
    # End of RPL_STATS* list.
    # @format 219 <client> <query> :<info>
    RPL_ENDOFSTATS = :"219"
    RPL_STATSPLINE_HYBRID = :"220"
    RPL_STATSBLINE_BAHAMUT_UNREAL = :"220"
    RPL_STATSWLINE = :"220"
    # Information about a user's own modes. Some daemons have extended the mode command and certain modes take parameters (like channel modes).
    # @format 221 <client> <user_modes> [<user_mode_params>]
    RPL_UMODEIS = :"221"
    RPL_MODLIST = :"222"
    RPL_SQLINE_NICK = :"222"
    RPL_STATSBLINE_BAHAMUT = :"222"
    RPL_STATSJLINE = :"222"
    RPL_CODEPAGE = :"222"
    RPL_STATSELINE_BAHAMUT = :"223"
    RPL_STATSGLINE_UNREAL = :"223"
    RPL_CHARSET = :"223"
    RPL_STATSFLINE_HYBRID_BAHAMUT = :"224"
    RPL_STATSTLINE_UNREAL = :"224"
    RPL_STATSDLINE_HYBRID = :"225"
    RPL_STATSCLONE = :"225"
    RPL_STATSELINE_UNREAL = :"225"
    RPL_STATSCOUNT = :"226"
    RPL_STATSALINE = :"226"
    RPL_STATSNLINE_UNREAL = :"226"
    RPL_STATSGLINE_BAHAMUT = :"227"
    RPL_STATSVLINE_UNREAL = :"227"
    # Returns details about active DNS blacklists and hits.
    RPL_STATSBLINE_RIZON = :"227"
    RPL_STATSQLINE_IRCU = :"228"
    RPL_STATSBANVER = :"228"
    RPL_STATSSPAMF = :"229"
    RPL_STATSEXCEPTTKL = :"230"
    RPL_RULES_UNREAL = :"232"
    # A service entry in the service list
    # @format 234 <client> <name> <server> <mask> <type> <hopcount> <info>
    RPL_SERVLIST = :"234"
    # Termination of an RPL_SERVLIST list
    # @format 235 <client> <mask> <type> :<info>
    RPL_SERVLISTEND = :"235"
    # Verbose server list?
    RPL_STATSVERBOSE = :"236"
    # Engine name?
    RPL_STATSENGINE = :"237"
    # Feature lines?
    RPL_STATSFLINE_IRCU = :"238"
    RPL_STATSIAUTH = :"239"
    RPL_STATSVLINE_RFC2812 = :"240"
    RPL_STATSXLINE_AUSTHEX = :"240"
    # Reply to STATS (See RFC)
    # @format 241 <client> L <hostmask> * <servername> <maxdepth>
    RPL_STATSLLINE = :"241"
    # Reply to STATS (See RFC)
    # @format 242 <client> :Server Up <days> days <hours>:<minutes>:<seconds>
    RPL_STATSUPTIME = :"242"
    # Reply to STATS O (See RFC); The privileges field is an extension in some IRC daemons, which returns either the name of a set of privileges, or a set of privileges. The class extension field returns which connection class the o-line applies to (this is also know to be placeholders like "0" and "-1" when inapplicable.) ircu doesn't have the privileges field and irc2 uses it to display which port, if any, the oper is restricted to.
    # @format 243 <client> O <hostmask> * <opername> [<privileges>] <class>
    RPL_STATSOLINE = :"243"
    # Reply to STATS (See RFC)
    # @format 244 <client> H <hostmask> * <servername>
    RPL_STATSHLINE = :"244"
    RPL_STATSSLINE = :"245"
    RPL_STATSTLINE_HYBRID = :"245"
    RPL_STATSSERVICE = :"246"
    RPL_STATSTLINE_IRCU = :"246"
    RPL_STATSULINE_HYBRID = :"246"
    RPL_STATSBLINE_RFC2812 = :"247"
    RPL_STATSXLINE_HYBRID_PTLINK_UNREAL = :"247"
    RPL_STATSGLINE_IRCU = :"247"
    RPL_STATSULINE_IRCU = :"248"
    RPL_STATSDEFINE = :"248"
    # Extension to RFC1459?
    RPL_STATSULINE = :"249"
    RPL_STATSDEBUG = :"249"
    RPL_STATSDLINE_RFC2812 = :"250"
    RPL_STATSCONN = :"250"
    # Reply to LUSERS command, other versions exist (eg. RFC2812); Text may vary.
    # @format 251 <client> :There are <int> users and <int> invisible on <int> servers
    RPL_LUSERCLIENT = :"251"
    # Reply to LUSERS command - Number of IRC operators online
    # @format 252 <client> <int> :operator(s) online
    RPL_LUSEROP = :"252"
    # Reply to LUSERS command - Number of connections in an unknown/unregistered state
    # @format 253 <client> <int> :unknown connection(s)
    RPL_LUSERUNKNOWN = :"253"
    # Reply to LUSERS command - Number of channels formed
    # @format 254 <client> <int> :channels formed
    RPL_LUSERCHANNELS = :"254"
    # Reply to LUSERS command - Information about local connections; Text may vary.
    # @format 255 <client> :I have <int> clients and <int> servers
    RPL_LUSERME = :"255"
    # Start of an RPL_ADMIN* reply. In practice, the server parameter is often never given, and instead the last parameter contains the text 'Administrative info about <server>'. Newer daemons seem to follow the RFC and output the server's hostname in the last parameter, but also output the server name in the text as per traditional daemons.
    # @format 256 <client> <server> :Administrative info
    RPL_ADMINME = :"256"
    # Reply to ADMIN command (Location, first line)
    # @format 257 <client> :<admin_location>
    RPL_ADMINLOC1 = :"257"
    # Reply to ADMIN command (Location, second line)
    # @format 258 <client> :<admin_location>
    RPL_ADMINLOC2 = :"258"
    # Reply to ADMIN command (E-mail address of administrator)
    # @format 259 <client> :<email_address>
    RPL_ADMINEMAIL = :"259"
    # See RFC
    # @format 261 <client> File <logfile> <debug_level>
    RPL_TRACELOG = :"261"
    # Extension to RFC1459?
    RPL_TRACEPING = :"262"
    # Used to terminate a list of RPL_TRACE* replies. Also known as RPL_ENDOFTRACE
    # @format 262 <client> <server_name> <version>[.<debug_level>] :<info>
    RPL_TRACEEND = :"262"
    # When a server drops a command without processing it, it MUST use this reply. The last parameter text changes, and commonly provides the client with more information about why the command could not be processed (such as rate-limiting). Also known as RPL_LOAD_THROTTLED and RPL_LOAD2HI, I'm presuming they do the same thing.
    # @format 263 <client> <command> :Please wait a while and try again.
    RPL_TRYAGAIN = :"263"
    RPL_USINGSSL_RUSNET_IRCD = :"264"
    # Returns the number of clients currently and the maximum number of clients that have been connected directly to this server at one time, respectively. The two optional parameters are not always provided. Also known as RPL_CURRENT_LOCAL
    # @format 265 <client> [<u> <m>] :Current local users <u>, max <m>
    RPL_LOCALUSERS = :"265"
    # Returns the number of clients currently connected to the network, and the maximum number of clients ever connected to the network at one time, respectively. Also known as RPL_CURRENT_GLOBAL
    # @format 266 <client> [<u> <m>] :Current global users <u>, max <m>
    RPL_GLOBALUSERS = :"266"
    RPL_START_NETSTAT = :"267"
    RPL_NETSTAT = :"268"
    RPL_END_NETSTAT = :"269"
    RPL_PRIVS = :"270"
    RPL_SILELIST = :"271"
    RPL_ENDOFSILELIST = :"272"
    RPL_NOTIFY = :"273"
    RPL_ENDNOTIFY = :"274"
    RPL_STATSDELTA = :"274"
    RPL_STATSDLINE_IRCU_ULTIMATE = :"275"
    # @format 275 <client> <nick> :is using a secure connection (SSL)
    RPL_USINGSSL_BAHAMUT = :"275"
    # Shows the SSL/TLS certificate fingerprint used by the client with the given nickname. Only sent when users `"WHOIS"` themselves or when an operator sends the `"WHOIS"`. Also adopted by hybrid 8.1 and charybdis 3.2
    # @format 276 <client> <nick> :has client certificate fingerprint <fingerprint>
    RPL_WHOISCERTFP = :"276"
    RPL_STATSRLINE = :"276"
    RPL_GLIST = :"280"
    RPL_ENDOFGLIST = :"281"
    RPL_ACCEPTLIST = :"281"
    RPL_ENDOFACCEPT = :"282"
    RPL_JUPELIST = :"282"
    RPL_ALIST = :"283"
    RPL_ENDOFJUPELIST = :"283"
    RPL_ENDOFALIST = :"284"
    RPL_FEATURE = :"284"
    RPL_GLIST_HASH = :"285"
    RPL_CHANINFO_HANDLE = :"285"
    RPL_NEWHOSTIS = :"285"
    RPL_CHANINFO_USERS = :"286"
    RPL_CHKHEAD = :"286"
    RPL_CHANINFO_CHOPS = :"287"
    RPL_CHANUSER = :"287"
    RPL_CHANINFO_VOICES = :"288"
    RPL_PATCHHEAD = :"288"
    RPL_CHANINFO_AWAY = :"289"
    RPL_PATCHCON = :"289"
    RPL_CHANINFO_OPERS = :"290"
    RPL_HELPHDR = :"290"
    RPL_DATASTR = :"290"
    RPL_CHANINFO_BANNED = :"291"
    RPL_HELPOP = :"291"
    RPL_ENDOFCHECK = :"291"
    RPL_CHANINFO_BANS = :"292"
    RPL_HELPTLR = :"292"
    ERR_SEARCHNOMATCH = :"292"
    RPL_CHANINFO_INVITE = :"293"
    RPL_HELPHLP = :"293"
    RPL_CHANINFO_INVITES = :"294"
    RPL_HELPFWD = :"294"
    RPL_CHANINFO_KICK = :"295"
    RPL_HELPIGN = :"295"
    RPL_CHANINFO_KICKS = :"296"
    RPL_END_CHANINFO = :"299"
    # Dummy reply, supposedly only used for debugging/testing new features, however has appeared in production daemons.
    RPL_NONE = :"300"
    # Used in reply to a command directed at a user who is marked as away
    # @format 301 <client> <nick> :<message>
    RPL_AWAY = :"301"
    # Reply used by USERHOST (see RFC)
    # @format 302 <client> :*1<reply> *( ' ' <reply> )
    RPL_USERHOST = :"302"
    # Reply to the ISON command (see RFC)
    # @format 303 <client> :*1<nick> *( ' ' <nick> )
    RPL_ISON = :"303"
    # Displays text to the user. This seems to have been defined in irc2.7h but never used. Servers generally use specific numerics or server notices instead of this. Unreal uses this numeric, but most others don't use it
    # @format 304 <client> :<text>
    RPL_TEXT = :"304"
    # Reply from AWAY when no longer marked as away
    # @format 305 <client> :<info>
    RPL_UNAWAY = :"305"
    # Reply from AWAY when marked away
    # @format 306 <client> :<info>
    RPL_NOWAWAY = :"306"
    RPL_USERIP = :"307"
    RPL_WHOISREGNICK = :"307"
    RPL_SUSERHOST = :"307"
    RPL_NOTIFYACTION = :"308"
    RPL_WHOISADMIN = :"308"
    # Also known as RPL_RULESTART (InspIRCd)
    RPL_RULESSTART_UNREAL = :"308"
    RPL_NICKTRACE = :"309"
    RPL_WHOISSADMIN = :"309"
    # Also known as RPL_RULESEND (InspIRCd)
    RPL_ENDOFRULES_UNREAL = :"309"
    RPL_WHOISHELPER = :"309"
    RPL_WHOISSVCMSG = :"310"
    RPL_WHOISHELPOP = :"310"
    RPL_WHOISSERVICE = :"310"
    # Reply to WHOIS - Information about the user
    # @format 311 <client> <nick> <user> <host> * :<real_name>
    RPL_WHOISUSER = :"311"
    # Reply to WHOIS - What server they're on
    # @format 312 <client> <nick> <server> :<server_info>
    RPL_WHOISSERVER = :"312"
    # Reply to WHOIS - User has IRC Operator privileges
    # @format 313 <client> <nick> :<privileges>
    RPL_WHOISOPERATOR = :"313"
    # Reply to WHOWAS - Information about the user
    # @format 314 <client> <nick> <user> <host> * :<real_name>
    RPL_WHOWASUSER = :"314"
    # Used to terminate a list of RPL_WHOREPLY replies
    # @format 315 <client> <name> :<info>
    RPL_ENDOFWHO = :"315"
    RPL_WHOISPRIVDEAF = :"316"
    # Reply to WHOIS - Idle information
    # @format 317 <client> <nick> <seconds> :seconds idle
    RPL_WHOISIDLE = :"317"
    # Reply to WHOIS - End of list
    # @format 318 <client> <nick> :<info>
    RPL_ENDOFWHOIS = :"318"
    # Reply to WHOIS - Channel list for user (See RFC)
    # @format 319 <client> <nick> :*( ( '@' / '+' ) <channel> ' ' )
    RPL_WHOISCHANNELS = :"319"
    RPL_WHOISVIRT = :"320"
    RPL_WHOIS_HIDDEN = :"320"
    RPL_WHOISSPECIAL = :"320"
    # Channel list - A channel
    # @format 322 <client> <channel> <#_visible> :<topic>
    RPL_LIST = :"322"
    # Channel list - End of list
    # @format 323 <client> :<info>
    RPL_LISTEND = :"323"
    # @format 324 <client> <channel> <mode> <mode_params>
    RPL_CHANNELMODEIS = :"324"
    # @format 325 <client> <channel> <nickname>
    RPL_UNIQOPIS = :"325"
    RPL_CHANNELPASSIS = :"325"
    RPL_WHOISWEBIRC = :"325"
    RPL_NOCHANPASS = :"326"
    RPL_CHPASSUNKNOWN = :"327"
    RPL_WHOISHOST_RUSNET_IRCD = :"327"
    # Also known as RPL_CHANNELURL in charybdis
    RPL_CHANNEL_URL = :"328"
    # Also known as RPL_CHANNELCREATED (InspIRCd)
    RPL_CREATIONTIME = :"329"
    RPL_WHOWAS_TIME = :"330"
    # Also known as RPL_WHOISLOGGEDIN (ratbox?, charybdis)
    # @format 330 <client> <nick> <authname> :<info>
    RPL_WHOISACCOUNT = :"330"
    # Response to TOPIC when no topic is set. Also known as RPL_NOTOPICSET (InspIRCd)
    # @format 331 <client> <channel> :<info>
    RPL_NOTOPIC = :"331"
    # Response to TOPIC with the set topic. Also known as RPL_TOPICSET (InspIRCd)
    # @format 332 <client> <channel> :<topic>
    RPL_TOPIC = :"332"
    # Also known as RPL_TOPICTIME (InspIRCd).
    RPL_TOPICWHOTIME = :"333"
    RPL_LISTUSAGE = :"334"
    RPL_COMMANDSYNTAX = :"334"
    RPL_LISTSYNTAX = :"334"
    RPL_WHOISBOT_UNREAL = :"335"
    # Since hybrid 8.2.0
    RPL_WHOISTEXT_HYBRID = :"335"
    RPL_WHOISACCOUNTONLY = :"335"
    # Since hybrid 8.2.0. Not to be confused with the more widely used 346. A "list of channels a client is invited to" sent with /INVITE
    # @format 336 <client> :<channel>
    RPL_INVITELIST_HYBRID = :"336"
    RPL_WHOISBOT_NEFARIOUS = :"336"
    # Since hybrid 8.2.0. Not to be confused with the more widely used 347.
    # @format 337 <client> :End of /INVITE list.
    RPL_ENDOFINVITELIST_HYBRID = :"337"
    # Before hybrid 8.2.0, for "User connected using a webirc gateway". Since charybdis 3.4.0 for "Underlying IPv4 is %s".
    RPL_WHOISTEXT_HYBRID_ALT = :"337"
    RPL_CHANPASSOK = :"338"
    RPL_WHOISACTUALLY = :"338"
    RPL_BADCHANPASS = :"339"
    RPL_WHOISMARKS = :"339"
    RPL_USERIP_IRCU = :"340"
    # Returned by the server to indicate that the attempted INVITE message was successful and is being passed onto the end client. Note that RFC1459 documents the parameters in the reverse order. The format given here is the format used on production servers, and should be considered the standard reply above that given by RFC1459.
    # @format 341 <client> <nick> <channel>
    RPL_INVITING = :"341"
    RPL_WHOISKILL = :"343"
    # Used by InspIRCd's m_geoban module.
    # @format 344 <client> <nick> <country code> :is connecting from <country>
    RPL_WHOISCOUNTRY = :"344"
    # MODE +R query
    # @format 344 <client> <channel> <mask>
    RPL_REOPLIST = :"344"
    # Sent to users on a channel when an INVITE command has been issued. Also known as RPL_ISSUEDINVITE (ircu)
    # @format 345 <client> <channel> <user being invited> <user issuing invite> :<user being invited> has been invited by <user issuing invite>
    RPL_INVITED = :"345"
    # MODE +R query
    # @format 345 <client> <channel>: :End of Channel Reop List
    RPL_ENDOFREOPLIST = :"345"
    # An invite mask for the invite mask list. Also known as RPL_INVEXLIST in hybrid 8.2.0
    # @format 346 <client> <channel> <invitemask>
    RPL_INVITELIST_RFC2812 = :"346"
    # Termination of an RPL_INVITELIST list. Also known as RPL_ENDOFINVEXLIST in hybrid 8.2.0
    # @format 347 <client> <channel> :<info>
    RPL_ENDOFINVITELIST_RFC2812 = :"347"
    # An exception mask for the exception mask list. Also known as RPL_EXLIST (Unreal, Ultimate). Bahamut calls this RPL_EXEMPTLIST and adds the last two optional params, <who> being either the nickmask of the client that set the exception or the server name, and <set-ts> being a unix timestamp representing when it was set.
    # @format 348 <client> <channel> <exceptionmask> [<who> <set-ts>]
    RPL_EXCEPTLIST = :"348"
    # Termination of an RPL_EXCEPTLIST list. Also known as RPL_ENDOFEXLIST (Unreal, Ultimate) or RPL_ENDOFEXEMPTLIST (Bahamut).
    # @format 349 <client> <channel> :<info>
    RPL_ENDOFEXCEPTLIST = :"349"
    # Used by InspIRCd's m_cgiirc module.
    # @format 350 <client> <real host> <real ip> :is connecting via {the <name> WebIRC, an ident} gateway
    RPL_WHOISGATEWAY = :"350"
    # Reply by the server showing its version details, however this format is not often adhered to
    # @format 351 <client> <version> <server> :<comments>
    RPL_VERSION = :"351"
    # Reply to vanilla WHO (See RFC). This format can be very different if the 'WHOX' version of the command is used (see ircu).
    # @format 352 <client> <channel> <user> <host> <server> <nick> <H|G>[*][@|+] :<hopcount> <real_name>
    RPL_WHOREPLY = :"352"
    # Reply to NAMES (See RFC)
    # @format 353 <client> ( '=' / '*' / '@' ) <channel> ' ' : [ '@' / '+' ] <nick> *( ' ' [ '@' / '+' ] <nick> )
    RPL_NAMREPLY = :"353"
    # Reply to WHO, however it is a 'special' reply because it is returned using a non-standard (non-RFC1459) format. The format is dictated by the command given by the user, and can vary widely. When this is used, the WHO command was invoked in its 'extended' form, as announced by the 'WHOX' ISUPPORT tag. Also known as RPL_RWHOREPLY (Bahamut).
    RPL_WHOSPCRPL = :"354"
    # Reply to the \users (when the channel is set +D, QuakeNet relative). The proper define name for this numeric is unknown at this time. Also known as RPL_DELNAMREPLY (ircu)
    # @format 355 <client> ( '=' / '*' / '@' ) <channel> ' ' : [ '@' / '+' ] <nick> *( ' ' [ '@' / '+' ] <nick> )
    RPL_NAMREPLY_ = :"355"
    RPL_MAP_AUSTHEX = :"357"
    RPL_MAPMORE_AUSTHEX = :"358"
    RPL_MAPEND_AUSTHEX = :"359"
    # Reply to the LINKS command
    # @format 364 <client> <mask> <server> :<hopcount> <server_info>
    RPL_LINKS = :"364"
    # Termination of an RPL_LINKS list
    # @format 365 <client> <mask> :<info>
    RPL_ENDOFLINKS = :"365"
    # Termination of an RPL_NAMREPLY list
    # @format 366 <client> <channel> :<info>
    RPL_ENDOFNAMES = :"366"
    # A ban-list item (See RFC); <setter>, <time left> and <reason> are additions used by various servers.
    # @format 367 <client> <channel> <banid> [[<setter> <time_left>|<time_left> :<reason>]]
    RPL_BANLIST = :"367"
    # Termination of an RPL_BANLIST list
    # @format 368 <client> <channel> :<info>
    RPL_ENDOFBANLIST = :"368"
    # Reply to WHOWAS - End of list
    # @format 369 <client> <nick> :<info>
    RPL_ENDOFWHOWAS = :"369"
    # Reply to INFO
    # @format 371 <client> :<string>
    RPL_INFO = :"371"
    # Reply to MOTD
    # @format 372 <client> :- <string>
    RPL_MOTD = :"372"
    # Termination of an RPL_INFO list
    # @format 374 <client> :<info>
    RPL_ENDOFINFO = :"374"
    # Start of an RPL_MOTD list
    # @format 375 <client> :- <server> Message of the day -
    RPL_MOTDSTART = :"375"
    # Termination of an RPL_MOTD list
    # @format 376 <client> :<info>
    RPL_ENDOFMOTD = :"376"
    RPL_KICKEXPIRED = :"377"
    RPL_BANEXPIRED = :"378"
    RPL_WHOISHOST_UNREAL = :"378"
    RPL_KICKLINKED = :"379"
    RPL_WHOISMODES_UNREAL = :"379"
    RPL_BANLINKED = :"380"
    RPL_YOURHELPER = :"380"
    # Successful reply from OPER. Also known as RPL_YOUAREOPER (InspIRCd)
    # @format 381 <client> :<info>
    RPL_YOUREOPER = :"381"
    # Successful reply from REHASH
    # @format 382 <client> <config_file> :<info>
    RPL_REHASHING = :"382"
    # Sent upon successful registration of a service
    # @format 383 <client> :You are service <service_name>
    RPL_YOURESERVICE = :"383"
    RPL_NOTOPERANYMORE = :"385"
    RPL_QLIST = :"386"
    RPL_IRCOPS_ULTIMATE = :"386"
    RPL_IRCOPSHEADER = :"386"
    RPL_ENDOFQLIST = :"387"
    RPL_ENDOFIRCOPS_ULTIMATE = :"387"
    RPL_IRCOPS_NEFARIOUS = :"387"
    RPL_ALIST_UNREAL = :"388"
    RPL_ENDOFIRCOPS_NEFARIOUS = :"388"
    RPL_ENDOFALIST_UNREAL = :"389"
    # Response to the TIME command. The string format may vary greatly.
    # @format 391 <client> <server> :<time string>
    RPL_TIME_RFC1459 = :"391"
    # This extension adds the timestamp and timestamp-offset information for clients.
    # @format 391 <client> <server> <timestamp> <offset> :<time string>
    RPL_TIME_IRCU = :"391"
    # Timezone name is acronym style (eg. 'EST', 'PST' etc). The microseconds field is the number of microseconds since the UNIX epoch, however it is relative to the local timezone of the server. The timezone field is ambiguous, since it only appears to include American zones.
    # @format 391 <client> <server> <timezone name> <microseconds> :<time string>
    RPL_TIME_BDQ_IRCD = :"391"
    # Yet another variation, including the time broken down into its components. Time is supposedly relative to UTC.
    # @format 391 <client> <server> <year> <month> <day> <hour> <minute> <second>
    RPL_TIME = :"391"
    # Start of an RPL_USERS list
    # @format 392 <client> :UserID   Terminal  Host
    RPL_USERSSTART = :"392"
    # Response to the USERS command (See RFC)
    # @format 393 <client> :<username> <ttyline> <hostname>
    RPL_USERS = :"393"
    # Termination of an RPL_USERS list
    # @format 394 <client> :<info>
    RPL_ENDOFUSERS = :"394"
    # Reply to USERS when nobody is logged in
    # @format 395 <client> :<info>
    RPL_NOUSERS = :"395"
    # Also known as RPL_YOURDISPLAYEDHOST (InspIRCd) or RPL_HOSTHIDDEN (ircu, charybdis, Quakenet, Unreal). <hostname> can also be in the form <user@hostname> (Quakenet).
    # @format 396 <client> <hostname> :is now your visible host
    RPL_VISIBLEHOST = :"396"
    # @format 399 <client> <local-count> <global-count> <cidr-range>
    RPL_CLONES = :"399"
    # Sent when an error occurred executing a command, but it is not specifically known why the command could not be executed.
    # @format 400 <client> <command> [<?>] :<info>
    ERR_UNKNOWNERROR = :"400"
    # Used to indicate the nickname parameter supplied to a command is currently unused
    # @format 401 <client> <nick> :<reason>
    ERR_NOSUCHNICK = :"401"
    # Used to indicate the server name given currently doesn't exist
    # @format 402 <client> <server> :<reason>
    ERR_NOSUCHSERVER = :"402"
    # Used to indicate the given channel name is invalid, or does not exist
    # @format 403 <client> <channel> :<reason>
    ERR_NOSUCHCHANNEL = :"403"
    # Sent to a user who does not have the rights to send a message to a channel
    # @format 404 <client> <channel> :<reason>
    ERR_CANNOTSENDTOCHAN = :"404"
    # Sent to a user when they have joined the maximum number of allowed channels and they tried to join another channel
    # @format 405 <client> <channel> :<reason>
    ERR_TOOMANYCHANNELS = :"405"
    # Returned by WHOWAS to indicate there was no history information for a given nickname
    # @format 406 <client> <nick> :<reason>
    ERR_WASNOSUCHNICK = :"406"
    # The given target(s) for a command are ambiguous in that they relate to too many targets
    # @format 407 <client> <target> :<reason>
    ERR_TOOMANYTARGETS = :"407"
    # Returned to a client which is attempting to send an SQUERY (or other message) to a service which does not exist
    # @format 408 <client> <service_name> :<reason>
    ERR_NOSUCHSERVICE = :"408"
    ERR_NOCOLORSONCHAN = :"408"
    # @format 408 <client> <channel> :You cannot use control codes on this channel. Not sent: <text>
    ERR_NOCTRLSONCHAN = :"408"
    # PING or PONG message missing the originator parameter which is required since these commands must work without valid prefixes
    # @format 409 <client> :<reason>
    ERR_NOORIGIN = :"409"
    # Returned when a client sends a CAP subcommand which is invalid or otherwise issues an invalid CAP command. Also known as ERR_INVALIDCAPSUBCOMMAND (InspIRCd) or ERR_UNKNOWNCAPCMD (ircu)
    # @format 410 <client> <badcmd> :Invalid CAP subcommand
    ERR_INVALIDCAPCMD = :"410"
    # Returned when no recipient is given with a command
    # @format 411 <client> :<reason>
    ERR_NORECIPIENT = :"411"
    # Returned when NOTICE/PRIVMSG is used with no message given
    # @format 412 <client> :<reason>
    ERR_NOTEXTTOSEND = :"412"
    # Used when a message is being sent to a mask without being limited to a top-level domain (i.e. * instead of *.au)
    # @format 413 <client> <mask> :<reason>
    ERR_NOTOPLEVEL = :"413"
    # Used when a message is being sent to a mask with a wild-card for a top level domain (i.e. *.*)
    # @format 414 <client> <mask> :<reason>
    ERR_WILDTOPLEVEL = :"414"
    # Used when a message is being sent to a mask with an invalid syntax
    # @format 415 <client> <mask> :<reason>
    ERR_BADMASK = :"415"
    # Returned when too many matches have been found for a command and the output has been truncated. An example would be the WHO command, where by the mask '*' would match everyone on the network! Ouch!
    # @format 416 <client> <command> [<mask>] :<info>
    ERR_TOOMANYMATCHES = :"416"
    # Same as ERR_TOOMANYMATCHES
    ERR_QUERYTOOLONG = :"416"
    # Returned when an input line is longer than the server can process (512 bytes), to let the client know this line was dropped (rather than being truncated)
    ERR_INPUTTOOLONG = :"417"
    ERR_LENGTHTRUNCATED = :"419"
    # Used by InspIRCd's m_abbreviation module
    # @format 420 <client> :Ambiguous abbreviation
    ERR_AMBIGUOUSCOMMAND = :"420"
    # Returned when the given command is unknown to the server (or hidden because of lack of access rights)
    # @format 421 <client> <command> :<reason>
    ERR_UNKNOWNCOMMAND = :"421"
    # Sent when there is no MOTD to send the client
    # @format 422 <client> :<reason>
    ERR_NOMOTD = :"422"
    # Returned by a server in response to an ADMIN request when no information is available. RFC1459 mentions this in the list of numerics. While it's not listed as a valid reply in section 4.3.7 ('Admin command'), it's confirmed to exist in the real world.
    # @format 423 <client> <server> :<reason>
    ERR_NOADMININFO = :"423"
    # Generic error message used to report a failed file operation during the processing of a command
    # @format 424 <client> :<reason>
    ERR_FILEERROR = :"424"
    ERR_NOOPERMOTD = :"425"
    ERR_TOOMANYAWAY = :"429"
    # Returned by NICK when the user is not allowed to change their nickname due to a channel event (channel mode +E)
    ERR_EVENTNICKCHANGE = :"430"
    # Returned when a nickname parameter expected for a command isn't found
    # @format 431 <client> :<reason>
    ERR_NONICKNAMEGIVEN = :"431"
    # Returned after receiving a NICK message which contains a nickname which is considered invalid, such as it's reserved ('anonymous') or contains characters considered invalid for nicknames. This numeric is misspelt, but remains with this name for historical reasons :)
    # @format 432 <client> <nick> :<reason>
    ERR_ERRONEUSNICKNAME = :"432"
    # Returned by the NICK command when the given nickname is already in use
    # @format 433 <client> <nick> :<reason>
    ERR_NICKNAMEINUSE = :"433"
    ERR_SERVICENAMEINUSE = :"434"
    ERR_NORULES = :"434"
    ERR_SERVICECONFUSED = :"435"
    # Also known as ERR_BANNICKCHANGE (ratbox, charybdis)
    ERR_BANONCHAN = :"435"
    # Returned by a server to a client when it detects a nickname collision
    # @format 436 <nick> :<reason>
    ERR_NICKCOLLISION = :"436"
    # Return when the target is unable to be reached temporarily, eg. a delay mechanism in play, or a service being offline
    # @format 437 <client> <nick/channel/service> :<reason>
    ERR_UNAVAILRESOURCE = :"437"
    ERR_BANNICKCHANGE = :"437"
    # Also known as ERR_NCHANGETOOFAST (Unreal, Ultimate)
    ERR_NICKTOOFAST = :"438"
    ERR_DEAD = :"438"
    # Also known as many other things, RPL_INVTOOFAST, RPL_MSGTOOFAST, ERR_TARGETTOFAST (Bahamut), etc
    ERR_TARGETTOOFAST = :"439"
    ERR_SERVICESDOWN = :"440"
    # Returned by the server to indicate that the target user of the command is not on the given channel
    # @format 441 <client> <nick> <channel> :<reason>
    ERR_USERNOTINCHANNEL = :"441"
    # Returned by the server whenever a client tries to perform a channel effecting command for which the client is not a member
    # @format 442 <client> <channel> :<reason>
    ERR_NOTONCHANNEL = :"442"
    # Returned when a client tries to invite a user to a channel they're already on
    # @format 443 <client> <nick> <channel> [:<reason>]
    ERR_USERONCHANNEL = :"443"
    # Returned by the SUMMON command if a given user was not logged in and could not be summoned
    # @format 444 <client> <user> :<reason>
    ERR_NOLOGIN = :"444"
    # Returned by SUMMON when it has been disabled or not implemented
    # @format 445 <client> :<reason>
    ERR_SUMMONDISABLED = :"445"
    # Returned by USERS when it has been disabled or not implemented
    # @format 446 <client> :<reason>
    ERR_USERSDISABLED = :"446"
    # This numeric is called ERR_CANTCHANGENICK in InspIRCd
    ERR_NONICKCHANGE = :"447"
    # Returned when this channel name has been explicitly blocked and is not allowed to be used.
    # @format 448 <channel> :Channel is forbidden: <reason>
    ERR_FORBIDDENCHANNEL = :"448"
    # Returned when a requested feature is not implemented (and cannot be completed)
    # @format 449 Unspecified
    ERR_NOTIMPLEMENTED = :"449"
    # Returned by the server to indicate that the client must be registered before the server will allow it to be parsed in detail
    # @format 451 <client> :<reason>
    ERR_NOTREGISTERED = :"451"
    ERR_IDCOLLISION = :"452"
    ERR_NICKLOST = :"453"
    ERR_HOSTILENAME = :"455"
    ERR_ACCEPTFULL = :"456"
    ERR_ACCEPTEXIST = :"457"
    ERR_ACCEPTNOT = :"458"
    # Not allowed to become an invisible operator?
    ERR_NOHIDING = :"459"
    ERR_NOTFORHALFOPS = :"460"
    # Returned by the server by any command which requires more parameters than the number of parameters given
    # @format 461 <client> <command> :<reason>
    ERR_NEEDMOREPARAMS = :"461"
    # Returned by the server to any link which attempts to register again Also known as ERR_ALREADYREGISTRED (sic) in ratbox/charybdis.
    # @format 462 <client> :<reason>
    ERR_ALREADYREGISTERED = :"462"
    # Returned to a client, which attempts to register with a server which has been configured to refuse connections from the client's host
    # @format 463 <client> :<reason>
    ERR_NOPERMFORHOST = :"463"
    # Returned by the PASS command to indicate the given password was required and was either not given or was incorrect
    # @format 464 <client> :<reason>
    ERR_PASSWDMISMATCH = :"464"
    # Returned to a client after an attempt to register on a server configured to ban connections from that client
    # @format 465 <client> :<reason>
    ERR_YOUREBANNEDCREEP = :"465"
    # Returned when the channel key for a channel has already been set
    # @format 467 <client> <channel> :<reason>
    ERR_KEYSET = :"467"
    ERR_INVALIDUSERNAME = :"468"
    ERR_ONLYSERVERSCANCHANGE = :"468"
    ERR_NOCODEPAGE = :"468"
    ERR_LINKSET = :"469"
    # Sent by a server to a user who tried to JOIN a channel, when they are forwarded to a different channel because they could not join the original one. The target channel is usually configured with +f (eg. Charybdis) or +L (eg. Unreal)
    ERR_LINKCHANNEL = :"470"
    ERR_KICKEDFROMCHAN = :"470"
    ERR_7BIT = :"470"
    # Returned when attempting to join a channel which is set +l and is already full
    # @format 471 <client> <channel> :<reason>
    ERR_CHANNELISFULL = :"471"
    # Returned when a given mode is unknown
    # @format 472 <client> <char> :<reason>
    ERR_UNKNOWNMODE = :"472"
    # Returned when attempting to join a channel, which is invite only without an invitation
    # @format 473 <client> <channel> :<reason>
    ERR_INVITEONLYCHAN = :"473"
    # Returned when attempting to join a channel a user is banned from
    # @format 474 <client> <channel> :<reason>
    ERR_BANNEDFROMCHAN = :"474"
    # Returned when attempting to join a key-locked channel either without a key or with the wrong key
    # @format 475 <client> <channel> :<reason>
    ERR_BADCHANNELKEY = :"475"
    # The given channel mask was invalid
    # @format 476 <client> <channel> :<reason>
    ERR_BADCHANMASK = :"476"
    # Returned when attempting to set a mode on a channel, which does not support channel modes, or channel mode changes. Also known as ERR_MODELESS
    # @format 477 <client> <channel> :<reason>
    ERR_NOCHANMODES = :"477"
    ERR_NEEDREGGEDNICK = :"477"
    # Returned when a channel access list (i.e. ban list etc) is full and cannot be added to
    # @format 478 <client> <channel> [char] :<reason>
    ERR_BANLISTFULL = :"478"
    # Returned to indicate that a given channel name is not valid. Servers that implement this use it instead of `ERR_NOSUCHCHANNEL` where appropriate.
    # @format 479 <client> <channel> :<reason>
    ERR_BADCHANNAME = :"479"
    ERR_LINKFAIL = :"479"
    ERR_NOCOLOR = :"479"
    ERR_NOULINE = :"480"
    ERR_CANNOTKNOCK = :"480"
    # @format 480 <nick> <channel> :Cannot join channel
    ERR_THROTTLE = :"480"
    ERR_NOWALLOP = :"480"
    # Returned by any command requiring special privileges (eg. IRC operator) to indicate the operation was unsuccessful
    # @format 481 <client> :<reason>
    ERR_NOPRIVILEGES = :"481"
    # Returned by any command requiring special channel privileges (eg. channel operator) to indicate the operation was unsuccessful. InspIRCd also uses this numeric "for other things like trying to kick a uline"
    # @format 482 <client> <channel> :<reason>
    ERR_CHANOPRIVSNEEDED = :"482"
    # Returned by KILL to anyone who tries to kill a server
    # @format 483 <client> :<reason>
    ERR_CANTKILLSERVER = :"483"
    # Sent by the server to a user upon connection to indicate the restricted nature of the connection (i.e. usermode +r)
    # @format 484 <client> :<reason>
    ERR_RESTRICTED = :"484"
    ERR_ISCHANSERVICE = :"484"
    ERR_DESYNC = :"484"
    ERR_ATTACKDENY = :"484"
    # Any mode requiring 'channel creator' privileges returns this error if the client is attempting to use it while not a channel creator on the given channel
    # @format 485 <client> :<reason>
    ERR_UNIQOPRIVSNEEDED = :"485"
    ERR_KILLDENY = :"485"
    ERR_CANTKICKADMIN = :"485"
    ERR_ISREALSERVICE = :"485"
    # @format 485 <client> <channel> :Cannot join channel (<reason>)
    ERR_CHANBANREASON = :"485"
    # Also known as ERR_ACCOUNTONLY.
    ERR_NONONREG = :"486"
    ERR_RLINED = :"486"
    ERR_CHANTOORECENT = :"487"
    ERR_MSGSERVICES = :"487"
    ERR_NOTFORUSERS = :"487"
    # Used for user mode +t (caller ID for all users not using SSL/TLS).
    # @format 487 <target user> :You must be connected using SSL/TLS to message this user
    ERR_NONONSSL = :"487"
    ERR_TSLESSCHAN = :"488"
    ERR_HTMDISABLED = :"488"
    # @format 488 <client> <channel> :SSL Only channel (+S), You must connect using SSL to join this channel.
    ERR_NOSSL = :"488"
    # Also known as ERR_SSLONLYCHAN.
    ERR_SECUREONLYCHAN = :"489"
    ERR_VOICENEEDED = :"489"
    # @format 490 <client> <channel> :all members of the channel must be connected via SSL
    ERR_ALLMUSTSSL = :"490"
    # @format 490 <client> :<nick> does not accept private messages containing swearing.
    ERR_NOSWEAR = :"490"
    # Returned by OPER to a client who cannot become an IRC operator because the server has been configured to disallow the client's host
    # @format 491 <client> :<reason>
    ERR_NOOPERHOST = :"491"
    # Notifies the user that a message they have sent to a channel has been rejected as it contains CTCPs, and they cannot send messages containing CTCPs to this channel. Also known as ERR_NOCTCPALLOWED (InspIRCd).
    # @format 492 <client> :You cannot send CTCPs to this channel. Not sent: <message>
    ERR_NOCTCP = :"492"
    # @format 492 <client> :Cannot send to user <nick> (<reason>)
    ERR_CANNOTSENDTOUSER = :"492"
    # @format 493 <client> :You cannot message that person because you do not share a common channel with them.
    ERR_NOSHAREDCHAN = :"493"
    ERR_NOFEATURE = :"493"
    ERR_BADFEATVALUE = :"494"
    # Used for mode +g (CALLERID) in charybdis.
    # @format 494 <client> <nick> :cannot answer you while you are <mode>, your message was not sent
    ERR_OWNMODE = :"494"
    ERR_BADLOGTYPE = :"495"
    ERR_BADLOGSYS = :"496"
    ERR_BADLOGVALUE = :"497"
    ERR_ISOPERLCHAN = :"498"
    # Works just like ERR_CHANOPRIVSNEEDED except it indicates that owner status (+q) is needed.
    ERR_CHANOWNPRIVNEEDED = :"499"
    # @format 500 <client> <string> :Too many join requests. Please wait a while and try again.
    ERR_TOOMANYJOINS = :"500"
    ERR_NOREHASHPARAM = :"500"
    # Returned by the server when a client tries to set MODE +r on a user or channel. This mode is set by services for registered users/channels.
    # @format 500 <client> :Only a server may modify the +r user/channel mode
    ERR_CANNOTSETMODER = :"500"
    # Returned by the server to indicate that a MODE message was sent with a nickname parameter and that the mode flag sent was not recognised.
    # @format 501 <client> :<reason>
    ERR_UMODEUNKNOWNFLAG = :"501"
    # @format 501 <client> <snomask> :is unknown mode char to me
    ERR_UNKNOWNSNOMASK = :"501"
    # Error sent to any user trying to view or change the user mode for a user other than themselves
    # @format 502 <client> :<reason>
    ERR_USERSDONTMATCH = :"502"
    ERR_USERNOTONSERV = :"504"
    ERR_SILELISTFULL = :"511"
    # Also known as ERR_NOTIFYFULL (aircd), I presume they are the same
    ERR_TOOMANYWATCH = :"512"
    ERR_NOSUCHGLINE_IRCU = :"512"
    # Also known as ERR_NEEDPONG (Unreal/Ultimate) for use during registration, however it is not used in Unreal (and might not be used in Ultimate either). Also known as ERR_WRONGPONG (Ratbox/charybdis)
    ERR_BADPING = :"513"
    ERR_TOOMANYDCC = :"514"
    ERR_NOSUCHJUPE = :"514"
    ERR_BADEXPIRE = :"515"
    ERR_DONTCHEAT = :"516"
    # @format 517 <client> <command> :<info/reason>
    ERR_DISABLED = :"517"
    ERR_NOINVITE = :"518"
    ERR_LONGMASK = :"518"
    ERR_ADMONLY = :"519"
    ERR_TOOMANYUSERS = :"519"
    # Also known as ERR_OPERONLYCHAN (Hybrid) and ERR_CANTJOINOPERSONLY (InspIRCd).
    # @format 520 :Cannot join channel (+O)
    ERR_OPERONLY = :"520"
    ERR_MASKTOOWIDE = :"520"
    ERR_LISTSYNTAX = :"521"
    ERR_NOSUCHGLINE_NEFARIOUS = :"521"
    ERR_WHOSYNTAX = :"522"
    # @format 523 <limit> :<command> search limit exceeded.
    ERR_WHOLIMEXCEED = :"523"
    ERR_QUARANTINED = :"524"
    ERR_OPERSPVERIFY = :"524"
    # @format 524 <term> :Help not found
    ERR_HELPNOTFOUND = :"524"
    ERR_INVALIDKEY = :"525"
    # @format 531 <client> <nick> :You are not permitted to send private messages to this user
    ERR_CANTSENDTOUSER = :"531"
    ERR_BADHOSTMASK = :"550"
    ERR_HOSTUNAVAIL = :"551"
    ERR_USINGSLINE = :"552"
    ERR_STATSSLINE = :"553"
    ERR_NOTLOWEROPLEVEL = :"560"
    ERR_NOTMANAGER = :"561"
    ERR_CHANSECURED = :"562"
    ERR_UPASSSET = :"563"
    ERR_UPASSNOTSET = :"564"
    ERR_NOMANAGER = :"566"
    ERR_UPASS_SAME_APASS = :"567"
    ERR_LASTERROR_IRCU = :"568"
    RPL_NOOMOTD = :"568"
    RPL_REAWAY = :"597"
    # Used when adding users to their `"WATCH"` list.
    RPL_GONEAWAY = :"598"
    # Used when adding users to their `"WATCH"` list.
    RPL_NOTAWAY = :"599"
    RPL_LOGON = :"600"
    RPL_LOGOFF = :"601"
    RPL_WATCHOFF = :"602"
    RPL_WATCHSTAT = :"603"
    RPL_NOWON = :"604"
    RPL_NOWOFF = :"605"
    RPL_WATCHLIST = :"606"
    RPL_ENDOFWATCHLIST = :"607"
    # Also known as RPL_CLEARWATCH in Unreal
    RPL_WATCHCLEAR = :"608"
    # Returned when adding users to their `"WATCH"` list.
    RPL_NOWISAWAY = :"609"
    RPL_MAPMORE_UNREAL = :"610"
    RPL_ISOPER = :"610"
    RPL_ISLOCOP = :"611"
    RPL_ISNOTOPER = :"612"
    RPL_ENDOFISOPER = :"613"
    RPL_MAPMORE_PTLINK = :"615"
    RPL_WHOISMODES_ULTIMATE = :"615"
    RPL_WHOISHOST_ULTIMATE = :"616"
    # @format 617 <client> <nick> :has client certificate fingerprint <fingerprint>
    RPL_WHOISSSLFP = :"617"
    RPL_DCCSTATUS = :"617"
    RPL_WHOISBOT_ULTIMATE = :"617"
    RPL_DCCLIST = :"618"
    RPL_ENDOFDCCLIST = :"619"
    RPL_WHOWASHOST = :"619"
    RPL_DCCINFO = :"620"
    RPL_RULESSTART_ULTIMATE = :"620"
    RPL_RULES_ULTIMATE = :"621"
    RPL_ENDOFRULES_ULTIMATE = :"622"
    RPL_MAPMORE_ULTIMATE = :"623"
    RPL_OMOTDSTART_ULTIMATE = :"624"
    RPL_OMOTD_ULTIMATE = :"625"
    RPL_ENDOFOMOTD_ULTIMATE = :"626"
    RPL_SETTINGS = :"630"
    RPL_ENDOFSETTINGS = :"631"
    # Sent when the user does not provide enough parameters for a command.
    # @format 650 <client> <command> :<syntax>
    RPL_SYNTAX = :"650"
    # @format 651 <client> <nick> :is on private/secret channels:
    RPL_CHANNELSMSG = :"651"
    # @format 652 <client> <nick> :was connecting from <host>
    RPL_WHOWASIP = :"652"
    # @format 653 <client> :You were uninvited from <chan> by <nick>
    RPL_UNINVITED = :"653"
    # Used to let a client know that a copy of their command has been passed to operators and the reason for it.
    # @format 659 <client> <command> :Command processed, but a copy has been sent to ircops for evaluation (anti-spam) purposes. [<reason>]
    RPL_SPAMCMDFWD = :"659"
    # Indicates that the client may begin the TLS handshake
    # @format 670 <client> :STARTTLS successful, proceed with TLS handshake
    RPL_STARTTLS = :"670"
    # The text in the last parameter may change. Also known as RPL_WHOISSSL (Nefarious).
    # @format 671 <client> <nick> :is using a secure connection
    RPL_WHOISSECURE = :"671"
    # Returns a full list of modes that are unknown when a client issues a MODE command (rather than one numeric per mode)
    # @format 672 <modes> :<info>
    RPL_UNKNOWNMODES = :"672"
    # Returns the real IP address of a client connected from a CGIIRC host, this has the real IP address of the client. This message is only sent to themselves or to IRC operators who perform a WHOIS on the user.
    # @format 672 <client> <nick> :is actually from <ip>
    RPL_WHOISREALIP = :"672"
    # Returns a full list of modes that cannot be set when a client issues a MODE command
    # @format 673 <modes> :<info>
    RPL_CANNOTSETMODES = :"673"
    # Used to display the user's TS6 UID in WHOIS.
    # @format 674 <client> :EUID is <euid>
    RPL_WHOISYOURID = :"674"
    # Indicates an error when setting a channel redirect (MODE +L) or using the banredirect module
    # @format 690 <client> :Target channel #chan must exist to be set as a redirect
    ERR_REDIRECT = :"690"
    # Indicates that a server-side error has occurred
    # @format 691 <client> :STARTTLS failed (Wrong moon phase)
    ERR_STARTTLS = :"691"
    # Indicates that there was a problem with a mode parameter. Replaces various non-standard mode specific numerics.
    # @format 696 <client> <target chan/user> <mode char> <parameter> :<description>
    ERR_INVALIDMODEPARAM = :"696"
    # Indicates that the user tried to set a list mode which is already set. Replaces various non-standard mode specific numerics.
    # @format 697 <client> <target chan> <parameter> <mode char> :<description>
    ERR_LISTMODEALREADYSET = :"697"
    # Indicates that the user tried to unset a list mode which is not set. Replaces various non-standard mode specific numerics.
    # @format 698 <client> <target chan> <parameter> <mode char> :<description>
    ERR_LISTMODENOTSET = :"698"
    # @format 700 <client> :<command> <module name> <minimum parameters> <penalty>
    RPL_COMMANDS = :"700"
    # @format 701 <client> :End of COMMANDS list
    RPL_COMMANDSEND = :"701"
    # Output from the MODLIST command
    # @format 702 <?> 0x<?> <?> <?>
    RPL_MODLIST_RATBOX = :"702"
    # Terminates MODLIST output
    # @format 703 <client> :<text>
    RPL_ENDOFMODLIST = :"703"
    # Start of HELP command output
    # @format 704 <client> <command> :<text>
    RPL_HELPSTART = :"704"
    # Output from HELP command
    # @format 705 <client> <command> :<text>
    RPL_HELPTXT = :"705"
    # End of HELP command output
    # @format 706 <client> <command> :<text>
    RPL_ENDOFHELP = :"706"
    # See doc/tgchange.txt in the charybdis source.
    # @format 707 <client> <target> :Targets changing too fast, message dropped
    ERR_TARGCHANGE = :"707"
    # Output from 'extended' trace
    # @format 708 <client> <Oper|User> <class> <nick> <username> <host> <ip> :<capabilities>
    RPL_ETRACEFULL = :"708"
    # Output from 'extended' trace
    # @format 709 <client> <Oper|User> <?> <nick> <username> <host> :<ip>
    RPL_ETRACE = :"709"
    # Message delivered using KNOCK command
    # @format 710 <client> <channel> <nick>!<user>@<host> :<text>
    RPL_KNOCK = :"710"
    # Message returned from using KNOCK command (KNOCK delivered)
    # @format 711 <client> <channel> :<text>
    RPL_KNOCKDLVR = :"711"
    # Message returned when too many KNOCKs for a channel have been sent by a user
    # @format 712 <client> <channel> :<text>
    ERR_TOOMANYKNOCK = :"712"
    # Message returned from KNOCK when the channel can be freely joined by the user
    # @format 713 <client> <channel> :<text>
    ERR_CHANOPEN = :"713"
    # Message returned from KNOCK when the user has used KNOCK on a channel they have already joined
    # @format 714 <client> <channel> :<text>
    ERR_KNOCKONCHAN = :"714"
    # Returned from KNOCK when the command has been disabled
    # @format 715 <client> :<text>
    ERR_KNOCKDISABLED = :"715"
    # Sent to indicate an INVITE has been blocked. The last parameter is the literal string "channel" if this is because the channel has had too many INVITEs in a given time, and "user" if this is because the user has sent too many INVITEs in a given time
    # @format 715 <client> <channel> :Too many INVITEs (<channel/user>).
    ERR_TOOMANYINVITE = :"715"
    # Sent to indicate an INVITE has been blocked.
    # @format 715 <client> <nick> <channel> :You are inviting too fast, invite to <nick> for <channel> not sent.
    RPL_INVITETHROTTLE = :"715"
    # Sent to indicate the given target is set +g (server-side ignore) Mentioned as RPL_TARGUMODEG in the CALLERID spec, ERR_TARGUMODEG in the ratbox/charybdis implementations.
    # @format 716 <nick> :<info>
    RPL_TARGUMODEG = :"716"
    # Sent following a PRIVMSG/NOTICE to indicate the target has been notified of an attempt to talk to them while they are set +g
    # @format 717 <nick> :<info>
    RPL_TARGNOTIFY = :"717"
    # Sent to a user who is +g to inform them that someone has attempted to talk to them (via PRIVMSG/NOTICE), and that they will need to be accepted (via the ACCEPT command) before being able to talk to them
    # @format 718 <client> <nick> <user>@<host> :<info>
    RPL_UMODEGMSG = :"718"
    # IRC Operator MOTD header, sent upon OPER command
    # @format 720 <client> :<text>
    RPL_OMOTDSTART_RATBOX = :"720"
    # IRC Operator MOTD text (repeated, usually)
    # @format 721 <client> :<text>
    RPL_OMOTD_RATBOX = :"721"
    # IRC operator MOTD footer
    # @format 722 <client> :<text>
    RPL_ENDOFOMOTD_RATBOX = :"722"
    # Returned from an oper command when the IRC operator does not have the relevant operator privileges.
    # @format 723 <client> <command> :<text>
    ERR_NOPRIVS = :"723"
    # Reply from an oper command reporting how many users match a given user@host mask
    # @format 724 <client> <nick>!<user>@<host> <?> <?> :<text>
    RPL_TESTMASK = :"724"
    # Reply from an oper command reporting relevant I/K lines that will match a given user@host
    # @format 725 <client> <?> <?> <?> :<?>
    RPL_TESTLINE = :"725"
    # Reply from oper command reporting no I/K lines match the given user@host
    # @format 726 <client> <?> :<text>
    RPL_NOTESTLINE = :"726"
    # From the m_testmask module, "Shows the number of matching local and global clients for a user@host mask"
    # @format 727 <client> <lcount> <gcount> <nick>!<user>@<host> <gecos> :Local/remote clients match
    RPL_TESTMASKGECOS = :"727"
    # Same thing as RPL_BANLIST, but for mode +q (quiet)
    # @format 728 <client> <channel> q <banid> [<time_left> :<reason>]
    RPL_QUIETLIST = :"728"
    # Same thing as RPL_ENDOFBANLIST, but for mode +q (quiet)
    # @format 729 <client> <channel> q :<info>
    RPL_ENDOFQUIETLIST = :"729"
    # Used to indicate to a client that either a target has just become online, or that a target they have added to their monitor list is online
    # @format 730 <client> :target[!user@host][,target[!user@host]]*
    RPL_MONONLINE = :"730"
    # Used to indicate to a client that either a target has just left the IRC network, or that a target they have added to their monitor list is offline
    # @format 731 <client> :target[,target2]*
    RPL_MONOFFLINE = :"731"
    # Used to indicate to a client the list of targets they have in their monitor list
    # @format 732 <client> :target[,target2]*
    RPL_MONLIST = :"732"
    # Used to indicate to a client the end of a monitor list
    # @format 733 <client> :End of MONITOR list
    RPL_ENDOFMONLIST = :"733"
    # Used to indicate to a client that their monitor list is full, so the MONITOR command failed
    # @format 734 <client> <limit> <targets> :Monitor list is full.
    ERR_MONLISTFULL = :"734"
    # From the ratbox m_challenge module, to auth opers.
    # @format 740 <client> :<chal_line>
    RPL_RSACHALLENGE2 = :"740"
    # From the ratbox m_challenge module, to auth opers.
    # @format 741 <client> :End of CHALLENGE
    RPL_ENDOFRSACHALLENGE2 = :"741"
    # InspIRCd 2.0 doesn't send the <client> parameter, while 3.0 does
    # @format 742 <client> <channel> <modechar> <mlock> :MODE cannot be set due to channel having an active MLOCK restriction policy
    ERR_MLOCKRESTRICTED = :"742"
    # @format 743 <channel> <modechar> <mask> :Invalid ban mask
    ERR_INVALIDBAN = :"743"
    # Defined in the Charybdis source code with the comment `"/* inspircd */"`
    ERR_TOPICLOCK = :"744"
    # From the ratbox m_scan module.
    # @format 750 <count> :matches
    RPL_SCANMATCHED = :"750"
    # From the ratbox m_scan module.
    # @format 751 <nick> <username> <host> <sockhost> <servname> <umodes> :<info>
    RPL_SCANUMODES = :"751"
    RPL_ETRACEEND = :"759"
    # Reply to WHOIS - Metadata key/value associated with the target
    # @format 760 <Target> <Key> <Visibility> :<Value>
    RPL_WHOISKEYVALUE = :"760"
    # Returned to show a currently set metadata key and its value, or a metadata key that has been cleared if no value is present in the response
    # @format 761 <Target> <Key> <Visibility>[ :<Value>]
    RPL_KEYVALUE = :"761"
    # Indicates the end of a list of metadata keys
    # @format 762 :end of metadata
    RPL_METADATAEND = :"762"
    # Used to indicate to a client that their metadata store is full, and they cannot add the requested key(s)
    # @format 764 <Target> :metadata limit reached
    ERR_METADATALIMIT = :"764"
    # Indicates to a client that the target of a sent METADATA command is invalid
    # @format 765 <Target> :invalid metadata target
    ERR_TARGETINVALID = :"765"
    # Indicates to a client that the requested metadata key does not exist
    # @format 766 <Key> :no matching key
    ERR_NOMATCHINGKEY = :"766"
    # Indicates to a client that the requested metadata key is not valid
    # @format 767 <Key> :invalid metadata key
    ERR_KEYINVALID = :"767"
    # Indicates to a client that the metadata key they requested to clear is not already set
    # @format 768 <Target> <Key> :key not set
    ERR_KEYNOTSET = :"768"
    # Indicates to a client that they do not have permission to set the requested metadata key
    # @format 769 <Target> <Key> :permission denied
    ERR_KEYNOPERMISSION = :"769"
    # Used to send 'eXtended info' to the client, a replacement for the STATS command to send a large variety of data and minimize numeric pollution.
    RPL_XINFO = :"771"
    # Start of an RPL_XINFO list
    RPL_XINFOSTART = :"773"
    # Termination of an RPL_XINFO list
    RPL_XINFOEND = :"774"
    # Used by the m_geoclass module of InspIRCd.
    # @format 801 <count> <code> :<country>
    RPL_STATSCOUNTRY = :"801"
    # Used by the m_check module of InspIRCd.
    RPL_CHECK = :"802"
    # Similar to RPL_UMODEIS but used when an oper views the mode of another user.
    # @format 803 <client> <nick> <user modes> <user mode parameters>
    RPL_OTHERUMODEIS = :"803"
    # Similar to RPL_SNOMASK but used when an oper views the snomasks of another user.
    # @format 804 <client> <nick> <server notice mask> :Server notice mask
    RPL_OTHERSNOMASKIS = :"804"
    # Sent when the user's account name is set (whether by SASL or otherwise)
    # @format 900 <client> <nick>!<ident>@<host> <account> :You are now logged in as <user>
    RPL_LOGGEDIN = :"900"
    # Sent when the user's account name is unset (whether by SASL or otherwise)
    # @format 901 <client> <nick>!<ident>@<host> :You are now logged out
    RPL_LOGGEDOUT = :"901"
    # Sent when the SASL authentication fails because the account is currently locked out, held, or otherwise administratively made unavailable.
    # @format 902 <client> :You must use a nick assigned to you.
    ERR_NICKLOCKED = :"902"
    # Sent when the SASL authentication finishes successfully
    # @format 903 <client> :SASL authentication successful
    RPL_SASLSUCCESS = :"903"
    # Sent when the SASL authentication fails because of invalid credentials or other errors not explicitly mentioned by other numerics
    # @format 904 <client> :SASL authentication failed
    ERR_SASLFAIL = :"904"
    # Sent when credentials are valid, but the SASL authentication fails because the client-sent AUTHENTICATE command was too long (i.e. the parameter longer than 400 bytes)
    # @format 905 <client> :SASL message too long
    ERR_SASLTOOLONG = :"905"
    # Sent when the SASL authentication is aborted because the client sent an AUTHENTICATE command with * as the parameter
    # @format 906 <client> :SASL authentication aborted
    ERR_SASLABORTED = :"906"
    # Sent when the client attempts to initiate SASL authentication after it has already finished successfully for that connection.
    # @format 907 <client> :You have already authenticated using SASL
    ERR_SASLALREADY = :"907"
    # Sent when the client requests a list of SASL mechanisms supported by the server (or network, services). The numeric contains a comma-separated list of mechanisms
    # @format 908 <client> <mechanisms> :are available SASL mechanisms
    RPL_SASLMECHS = :"908"
    # Used by InspIRCd's m_autoop module.
    # @format 910 <client> <channel> <status>:<mask> <who> <set-ts>
    RPL_ACCESSLIST = :"910"
    # Used by InspIRCd's m_autoop module.
    # @format 911 <client> <channel> :End of channel access list
    RPL_ENDOFACCESSLIST = :"911"
    # Used by InspIRCd's m_denychans module.
    # @format 926 <client> <channel> :Channel <channel> is forbidden: <reason>
    ERR_BADCHANNEL = :"926"
    # Used by InspIRCd's m_chanfilter module.
    # @format 940 <client> <channel> :End of channel spamfilter list
    RPL_ENDOFSPAMFILTER = :"940"
    # Used by InspIRCd's m_chanfilter module.
    # @format 941 <client> <channel> <filter> <who> <set-ts>
    RPL_SPAMFILTER = :"941"
    # Used by InspIRCd's m_watch module.
    # @format 942 <client> <nick> :Invalid nickname
    ERR_INVALIDWATCHNICK = :"942"
    # Used by InspIRCd's m_setidle module.
    # @format 944 <client> :Idle time set.
    RPL_IDLETIMESET = :"944"
    # Used by InspIRCd's m_nicklock module.
    # @format 945 <client> <nick> :Nickname now unlocked.
    RPL_NICKLOCKOFF = :"945"
    # Used by InspIRCd's m_nicklock module.
    # @format 946 <client> <nick> :This user's nickname is not locked.
    ERR_NICKNOTLOCKED = :"946"
    # Used by InspIRCd's m_nicklock module.
    # @format 947 <client> <nick> :Nickname now locked.
    RPL_NICKLOCKON = :"947"
    # Used by InspIRCd's m_setidle module.
    # @format 948 <client> :Invalid idle time.
    ERR_INVALIDIDLETIME = :"948"
    # Used by InspIRCd's m_silence module.
    # @format 950 <client> <nick> :Removed <mask> <pattern> from silence list
    RPL_UNSILENCED = :"950"
    # Used by InspIRCd's m_silence module.
    # @format 951 <client> <nick> :Added <mask> <pattern> to silence list
    RPL_SILENCED = :"951"
    # Used by InspIRCd's m_silence module. The flags field was added in v3.
    # @format 952 <client> <mask> [<flags>] :<reason>
    ERR_SILENCE = :"952"
    # Used by InspIRCd's m_exemptchanop module.
    # @format 953 <client> <channel> :End of channel exemptchanops list
    RPL_ENDOFEXEMPTIONLIST = :"953"
    # Used by InspIRCd's m_exemptchanop module.
    # @format 954 <client> <channel> <exception> <who> :<set-ts>
    RPL_EXEMPTIONLIST = :"954"
    # Used by InspIRCd's m_namedmodes module.
    # @format 960 <client> <channel> :End of mode list
    RPL_ENDOFPROPLIST = :"960"
    # Used by InspIRCd's m_namedmodes module.
    # @format 961 <client> <channel> [+<mode>]...
    RPL_PROPLIST = :"961"
    # Indicates that a command could not be performed for an arbitrary reason. For example, a halfop trying to kick an op.
    # @format 972 <client> <command> :<info>
    ERR_CANNOTDOCOMMAND = :"972"
    # @format 972 <client> <modulename> :Failed to unload module: <error>
    ERR_CANTUNLOADMODULE = :"972"
    # @format 973 <client> <modulename> :Module successfully unloaded.
    RPL_UNLOADEDMODULE = :"973"
    # Indicates that a channel mode could not be changed for an arbitrary reason. For instance, trying to set OPER_ONLY when you are not an IRC operator.
    # @format 974 <client> <mode> :<info>
    ERR_CANNOTCHANGECHANMODE = :"974"
    # @format 974 <client> <modulename> :Failed to load module: <error>
    ERR_CANTLOADMODULE = :"974"
    # @format 975 <client> <modulename> :Module successfully loaded.
    RPL_LOADEDMODULE = :"975"
    ERR_LASTERROR_NEFARIOUS = :"975"
    # Used by InspIRCd's m_lockserv module.
    # @format 988 <client> <server> :Closed for new connections
    RPL_SERVLOCKON = :"988"
    # Used by InspIRCd's m_lockserv module.
    # @format 989 <client> <server> :Open for new connections
    RPL_SERVLOCKOFF = :"989"
    # Used by InspIRCd's m_dccallow module
    # @format 990 <client> :Users on your DCCALLOW list:
    RPL_DCCALLOWSTART = :"990"
    # Used by InspIRCd's m_dccallow module
    # @format 991 <client> <nick> :<nick> (<hostmask>)
    RPL_DCCALLOWLIST = :"991"
    # Used by InspIRCd's m_dccallow module
    # @format 992 <client> :End of DCCALLOW list
    RPL_DCCALLOWEND = :"992"
    # Used by InspIRCd's m_dccallow module
    # @format 993 <client> <nick> :Added <nick> to DCCALLOW list for <count> seconds
    RPL_DCCALLOWTIMED = :"993"
    # Used by InspIRCd's m_dccallow module
    # @format 994 <client> <nick> :Added <nick> to DCCALLOW list for this session
    RPL_DCCALLOWPERMANENT = :"994"
    # Used by InspIRCd's m_dccallow module.
    # @format 995 <client> <nick> :Removed <nick> from your DCCALLOW list
    RPL_DCCALLOWREMOVED = :"995"
    # Used by InspIRCd's m_dccallow module.
    # @format 996 <client> <nick> :<reason>
    ERR_DCCALLOWINVALID = :"996"
    # Used by InspIRCd's m_dccallow module.
    # @format 997 <client> <nick> :DCCALLOW entry for <nick> has expired
    RPL_DCCALLOWEXPIRED = :"997"
    # Used by InspIRCd's m_dccallow module.
    # @format 998 <client> :DCCALLOW command not understood
    ERR_UNKNOWNDCCALLOWCMD = :"998"
    # Also known as ERR_NUMERICERR (Unreal) or ERR_LAST_ERR_MSG
    ERR_NUMERIC_ERR = :"999"
  end
end
