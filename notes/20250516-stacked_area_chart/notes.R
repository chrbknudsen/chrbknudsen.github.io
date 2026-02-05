library(httr2)
library(rvest)

url <- "https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data"

url <- "https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data#:~:text=addiction%2E-,NHMRC,90%2E6"


read_html(url)

# Byg request
req <- request(url) %>%
  req_options(http_version = 1L) %>%     # Tving HTTP/1.1
  req_user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64)") %>%
  req_headers(
    "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language" = "en-US,en;q=0.5",
    "Connection" = "keep-alive",
    "Upgrade-Insecure-Requests" = "1"
  ) %>%
  req_timeout(15) %>%
  req_retry(max_tries = 3)

# Udfør anmodning
resp <- req_perform(req)




library(httr)
library(rvest)

url <- "https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data"
url <- "https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data#:~:text=addiction%2E-,NHMRC,90%2E6"
res <- GET(
  url,
  user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36"),
  config = httr::config(http_version = 0)
)

read_html_live("https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data#:~:text=addiction%2E-,NHMRC,90%2E6")

html <- read_html(url)
h(url)
           
res <- curl::curl_fetch_memory(
  url,
  handle = curl::new_handle(
    http_version = 1L,
    useragent = "Mozilla/5.0"
  )
)
html <- read_html(rawToChar(res$content))




library(httr2)
library(rvest)

req <- request("https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data") |>
  req_user_agent("Mozilla/5.0") |>
  req_options(timeout = 60, http_version = 1)

resp <- req |> req_perform()
html <- read_html(resp)






tmp <- tempfile(fileext = ".xlsx")
download.file("https://www.nhmrc.gov.au/sites/default/files/documents/attachments/2023-funding-summary.xlsx", tmp, mode = "wb")
df <- readxl::read_excel(tmp)












library(chromote)
library(rvest)

b <- ChromoteSession$new()
b$Page$navigate(url)
b$Page$loadEventFired()
html <- b$Runtime$evaluate("document.documentElement.outerHTML")$result$value
doc <- read_html(html)
tbls <- doc %>% html_nodes("table") %>% html_table(fill=T)
tbls



# suk ------

install.packages("RSelenium")
library(RSelenium)
library(rvest)

remDr <- remoteDriver(browserName = "chrome", port = 4445L)
remDr$open()
remDr$navigate("https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data")
Sys.sleep(20)  # vent på sideindlæsning

page <- remDr$getPageSource()[[1]]
html <- read_html(page)
tables <- html %>% html_elements("table") %>% html_table(fill = TRUE)

length(tables)  # hvor mange tabeller blev fundet
head(tables[[1]])

# det er lidt sært - for jeg kan gøre det her på arbejdet og på arbejdscomputeren.
# Men ikke på min hindbærtærte hjemme. Eller på computeren i stuen.
# Og heller ikke selvom computeren i stuen kommer på min mobils hotspot.
# Så...

# Mon ikke jeg skal kigge på hvad output af denne er på 
# arbejdsmaskinen?
curl::curl_options()

library(curl)
curl::curl_download("https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data", destfile = "test.txt")



på hindbærtærten:

> curl::curl_options()
      abstract_unix_socket           accepttimeout_ms 
                     10264                        212 
           accept_encoding              address_scope 
                     10102                        171 
                    altsvc                altsvc_ctrl 
                     10287                        286 
                    append                autoreferer 
                        50                         58 
                 aws_sigv4                 buffersize 
                     10305                         98 
                    cainfo                cainfo_blob 
                     10065                      40309 
                    capath           ca_cache_timeout 
                     10097                        321 
                  certinfo         chunk_bgn_function 
                       172                      20198 
                chunk_data         chunk_end_function 
                     10201                      20199 
           closesocketdata        closesocketfunction 
                     10209                      20208 
            connecttimeout          connecttimeout_ms 
                        78                        156 
              connect_only                 connect_to 
                       141                      10243 
conv_from_network_function    conv_from_utf8_function 
                     20142                      20144 
  conv_to_network_function                     cookie 
                     20143                      10022 
                cookiefile                  cookiejar 
                     10031                      10082 
                cookielist              cookiesession 
                     10135                         96 
            copypostfields                       crlf 
                     10165                         27 
                   crlfile                      curlu 
                     10169                      10282 
             customrequest                  debugdata 
                     10036                      10095 
             debugfunction           default_protocol 
                     20094                      10238 
               dirlistonly   disallow_username_in_url 
                        48                        278 
         dns_cache_timeout              dns_interface 
                        92                      10221 
             dns_local_ip4              dns_local_ip6 
                     10222                      10223 
               dns_servers      dns_shuffle_addresses 
                     10211                        275 
      dns_use_global_cache         doh_ssl_verifyhost 
                        91                        307 
        doh_ssl_verifypeer       doh_ssl_verifystatus 
                       306                        308 
                   doh_url                        ech 
                     10279                      10325 
                 egdsocket                errorbuffer 
                     10077                      10010 
     expect_100_timeout_ms                failonerror 
                       227                         45 
                  filetime               fnmatch_data 
                        69                      10202 
          fnmatch_function             followlocation 
                     20200                         52 
              forbid_reuse              fresh_connect 
                        75                         74 
                   ftpport                 ftpsslauth 
                     10017                        129 
               ftp_account    ftp_alternative_to_user 
                     10134                      10147 
   ftp_create_missing_dirs             ftp_filemethod 
                       110                        138 
          ftp_skip_pasv_ip                ftp_ssl_ccc 
                       137                        154 
              ftp_use_eprt               ftp_use_epsv 
                       106                         85 
              ftp_use_pret          gssapi_delegation 
                       188                        210 
 happy_eyeballs_timeout_ms            haproxyprotocol 
                       271                        274 
         haproxy_client_ip                     header 
                     10323                         42 
                headerdata             headerfunction 
                     10029                      20079 
                 headeropt                       hsts 
                       229                      10300 
              hstsreaddata           hstsreadfunction 
                     10302                      20301 
             hstswritedata          hstswritefunction 
                     10304                      20303 
                 hsts_ctrl             http09_allowed 
                       299                        285 
            http200aliases                   httpauth 
                     10104                        107 
                   httpget                 httpheader 
                        80                      10023 
                  httppost            httpproxytunnel 
                     10024                         61 
     http_content_decoding     http_transfer_decoding 
                       158                        157 
              http_version      ignore_content_length 
                        84                        136 
                infilesize           infilesize_large 
                        14                      30115 
                 interface             interleavedata 
                     10062                      10195 
        interleavefunction                  ioctldata 
                     20196                      10131 
             ioctlfunction                  ipresolve 
                     20130                        113 
                issuercert            issuercert_blob 
                     10170                      40295 
     keep_sending_on_error                  keypasswd 
                       245                      10026 
                  krblevel                  localport 
                     10063                        139 
            localportrange              login_options 
                       140                      10224 
           low_speed_limit             low_speed_time 
                        19                         20 
                 mail_auth                  mail_from 
                     10217                      10186 
                 mail_rcpt       mail_rcpt_allowfails 
                     10187                        290 
               maxage_conn                maxconnects 
                       288                         71 
               maxfilesize          maxfilesize_large 
                       114                      30117 
          maxlifetime_conn                  maxredirs 
                       314                         68 
      max_recv_speed_large       max_send_speed_large 
                     30146                      30145 
                  mimepost               mime_options 
                     10269                        315 
                     netrc                 netrc_file 
                        51                      10118 
       new_directory_perms             new_file_perms 
                       160                        159 
                    nobody                 noprogress 
                        44                         43 
                   noproxy                   nosignal 
                     10177                         99 
            opensocketdata         opensocketfunction 
                     10164                      20163 
                  password                 path_as_is 
                     10174                        234 
           pinnedpublickey                   pipewait 
                     10230                        237 
                      port                       post 
                         3                         47 
                postfields              postfieldsize 
                     10015                         60 
       postfieldsize_large                  postquote 
                     30120                      10039 
                 postredir                   prequote 
                       161                      10093 
                prereqdata             prereqfunction 
                     10313                      20312 
                 pre_proxy                    private 
                     10262                      10103 
          progressfunction                  protocols 
                     20056                        181 
             protocols_str                      proxy 
                     10318                      10004 
                 proxyauth                proxyheader 
                       111                      10228 
             proxypassword                  proxyport 
                     10176                         59 
                 proxytype              proxyusername 
                       101                      10175 
              proxyuserpwd               proxy_cainfo 
                     10006                      10246 
         proxy_cainfo_blob               proxy_capath 
                     40310                      10247 
             proxy_crlfile           proxy_issuercert 
                     10260                      10296 
     proxy_issuercert_blob            proxy_keypasswd 
                     40297                      10258 
     proxy_pinnedpublickey         proxy_service_name 
                     10263                      10235 
             proxy_sslcert          proxy_sslcerttype 
                     10254                      10255 
        proxy_sslcert_blob               proxy_sslkey 
                     40293                      10256 
          proxy_sslkeytype          proxy_sslkey_blob 
                     10257                      40294 
          proxy_sslversion      proxy_ssl_cipher_list 
                       250                      10259 
         proxy_ssl_options       proxy_ssl_verifyhost 
                       261                        249 
      proxy_ssl_verifypeer        proxy_tls13_ciphers 
                       248                      10277 
    proxy_tlsauth_password         proxy_tlsauth_type 
                     10252                      10253 
    proxy_tlsauth_username        proxy_transfer_mode 
                     10251                        166 
                       put                 quick_exit 
                        54                        322 
                     quote                random_file 
                     10028                      10076 
                     range                   readdata 
                     10007                      10009 
              readfunction            redir_protocols 
                     20012                        182 
       redir_protocols_str                    referer 
                     10319                      10016 
            request_target                    resolve 
                     10266                      10203 
       resolver_start_data    resolver_start_function 
                     10273                      20272 
               resume_from          resume_from_large 
                        21                      30116 
          rtsp_client_cseq               rtsp_request 
                       193                        189 
          rtsp_server_cseq            rtsp_session_id 
                       194                      10190 
           rtsp_stream_uri             rtsp_transport 
                     10191                      10192 
              sasl_authzid                    sasl_ir 
                     10289                        218 
                  seekdata               seekfunction 
                     10168                      20167 
   server_response_timeout server_response_timeout_ms 
                       112                        324 
              service_name                      share 
                     10236                      10100 
               sockoptdata            sockoptfunction 
                     10149                      20148 
               socks5_auth          socks5_gssapi_nec 
                       267                        180 
     socks5_gssapi_service             ssh_auth_types 
                     10179                        151 
           ssh_compression            ssh_hostkeydata 
                       268                      10317 
       ssh_hostkeyfunction    ssh_host_public_key_md5 
                     20316                      10162 
ssh_host_public_key_sha256                ssh_keydata 
                     10311                      10185 
           ssh_keyfunction             ssh_knownhosts 
                     20184                      10183 
       ssh_private_keyfile         ssh_public_keyfile 
                     10153                      10152 
                   sslcert                sslcerttype 
                     10025                      10086 
              sslcert_blob                  sslengine 
                     40291                      10089 
         sslengine_default                     sslkey 
                        90                      10087 
                sslkeytype                sslkey_blob 
                     10088                      40292 
                sslversion            ssl_cipher_list 
                        32                      10083 
              ssl_ctx_data           ssl_ctx_function 
                     10109                      20108 
             ssl_ec_curves            ssl_enable_alpn 
                     10298                        226 
            ssl_enable_npn             ssl_falsestart 
                       225                        233 
               ssl_options        ssl_sessionid_cache 
                       216                        150 
            ssl_verifyhost             ssl_verifypeer 
                        81                         64 
          ssl_verifystatus                     stderr 
                       232                      10037 
            stream_depends           stream_depends_e 
                     10240                      10241 
             stream_weight   suppress_connect_headers 
                       239                        265 
              tcp_fastopen              tcp_keepalive 
                       244                        213 
               tcp_keepcnt               tcp_keepidle 
                       326                        214 
             tcp_keepintvl                tcp_nodelay 
                       215                        121 
             telnetoptions               tftp_blksize 
                     10070                        178 
           tftp_no_options              timecondition 
                       242                         33 
                   timeout                 timeout_ms 
                        13                        155 
                 timevalue            timevalue_large 
                        34                      30270 
             tls13_ciphers           tlsauth_password 
                     10276                      10205 
              tlsauth_type           tlsauth_username 
                     10206                      10204 
               trailerdata            trailerfunction 
                     10284                      20283 
              transfertext          transfer_encoding 
                        53                        207 
          unix_socket_path          unrestricted_auth 
                     10231                        105 
        upkeep_interval_ms                     upload 
                       281                         46 
         upload_buffersize                        url 
                       280                      10002 
                 useragent                   username 
                     10018                      10173 
                   userpwd                    use_ssl 
                     10005                        119 
                   verbose              wildcardmatch 
                        41                        197 
                 writedata              writefunction 
                     10001                      20011 
                ws_options               xferinfodata 
                       320                      10057 
          xferinfofunction             xoauth2_bearer 
                     20219                      10220 

                     > curl_version()
                     $version
                     [1] "8.9.1"
                     
                     $headers
                     [1] "8.9.1"
                     
                     $ssl_version
                     [1] "OpenSSL/3.3.1"
                     
                     $libz_version
                     [1] "1.3.1"
                     
                     $libssh_version
                     [1] "libssh2/1.11.0"
                     
                     $libidn_version
                     [1] "2.3.7"
                     
                     $host
                     [1] "aarch64-unknown-linux-gnu"
                     
                     $protocols
                      [1] "dict"    "file"    "ftp"     "ftps"    "gopher"  "gophers"
                      [7] "http"    "https"   "imap"    "imaps"   "ldap"    "ldaps"  
                     [13] "mqtt"    "pop3"    "pop3s"   "rtmp"    "rtmpe"   "rtmps"  
                     [19] "rtmpt"   "rtmpte"  "rtmpts"  "rtsp"    "scp"     "sftp"   
                     [25] "smb"     "smbs"    "smtp"    "smtps"   "telnet"  "tftp"   
                     [31] "ws"      "wss"    
                     
                     $ipv6
                     [1] TRUE
                     
                     $http2
                     [1] TRUE
                     
                     $idn
                     [1] TRUE
                     
                     $url_parser
                     [1] TRUE



Og på arbejdskomputeren:
  > curl::curl_options()
      abstract_unix_socket           accepttimeout_ms            accept_encoding 
                     10264                        212                      10102 
             address_scope                     altsvc                altsvc_ctrl 
                       171                      10287                        286 
                    append                autoreferer                  aws_sigv4 
                        50                         58                      10305 
                buffersize                     cainfo                cainfo_blob 
                        98                      10065                      40309 
                    capath           ca_cache_timeout                   certinfo 
                     10097                        321                        172 
        chunk_bgn_function                 chunk_data         chunk_end_function 
                     20198                      10201                      20199 
           closesocketdata        closesocketfunction             connecttimeout 
                     10209                      20208                         78 
         connecttimeout_ms               connect_only                 connect_to 
                       156                        141                      10243 
conv_from_network_function    conv_from_utf8_function   conv_to_network_function 
                     20142                      20144                      20143 
                    cookie                 cookiefile                  cookiejar 
                     10022                      10031                      10082 
                cookielist              cookiesession             copypostfields 
                     10135                         96                      10165 
                      crlf                    crlfile                      curlu 
                        27                      10169                      10282 
             customrequest                  debugdata              debugfunction 
                     10036                      10095                      20094 
          default_protocol                dirlistonly   disallow_username_in_url 
                     10238                         48                        278 
         dns_cache_timeout              dns_interface              dns_local_ip4 
                        92                      10221                      10222 
             dns_local_ip6                dns_servers      dns_shuffle_addresses 
                     10223                      10211                        275 
      dns_use_global_cache         doh_ssl_verifyhost         doh_ssl_verifypeer 
                        91                        307                        306 
      doh_ssl_verifystatus                    doh_url                        ech 
                       308                      10279                      10325 
                 egdsocket                errorbuffer      expect_100_timeout_ms 
                     10077                      10010                        227 
               failonerror                   filetime               fnmatch_data 
                        45                         69                      10202 
          fnmatch_function             followlocation               forbid_reuse 
                     20200                         52                         75 
             fresh_connect                    ftpport                 ftpsslauth 
                        74                      10017                        129 
               ftp_account    ftp_alternative_to_user    ftp_create_missing_dirs 
                     10134                      10147                        110 
            ftp_filemethod           ftp_skip_pasv_ip                ftp_ssl_ccc 
                       138                        137                        154 
              ftp_use_eprt               ftp_use_epsv               ftp_use_pret 
                       106                         85                        188 
         gssapi_delegation  happy_eyeballs_timeout_ms            haproxyprotocol 
                       210                        271                        274 
         haproxy_client_ip                     header                 headerdata 
                     10323                         42                      10029 
            headerfunction                  headeropt                       hsts 
                     20079                        229                      10300 
              hstsreaddata           hstsreadfunction              hstswritedata 
                     10302                      20301                      10304 
         hstswritefunction                  hsts_ctrl             http09_allowed 
                     20303                        299                        285 
            http200aliases                   httpauth                    httpget 
                     10104                        107                         80 
                httpheader                   httppost            httpproxytunnel 
                     10023                      10024                         61 
     http_content_decoding     http_transfer_decoding               http_version 
                       158                        157                         84 
     ignore_content_length                 infilesize           infilesize_large 
                       136                         14                      30115 
                 interface             interleavedata         interleavefunction 
                     10062                      10195                      20196 
                 ioctldata              ioctlfunction                  ipresolve 
                     10131                      20130                        113 
                issuercert            issuercert_blob      keep_sending_on_error 
                     10170                      40295                        245 
                 keypasswd                   krblevel                  localport 
                     10026                      10063                        139 
            localportrange              login_options            low_speed_limit 
                       140                      10224                         19 
            low_speed_time                  mail_auth                  mail_from 
                        20                      10217                      10186 
                 mail_rcpt       mail_rcpt_allowfails                maxage_conn 
                     10187                        290                        288 
               maxconnects                maxfilesize          maxfilesize_large 
                        71                        114                      30117 
          maxlifetime_conn                  maxredirs       max_recv_speed_large 
                       314                         68                      30146 
      max_send_speed_large                   mimepost               mime_options 
                     30145                      10269                        315 
                     netrc                 netrc_file        new_directory_perms 
                        51                      10118                        160 
            new_file_perms                     nobody                 noprogress 
                       159                         44                         43 
                   noproxy                   nosignal             opensocketdata 
                     10177                         99                      10164 
        opensocketfunction                   password                 path_as_is 
                     20163                      10174                        234 
           pinnedpublickey                   pipewait                       port 
                     10230                        237                          3 
                      post                 postfields              postfieldsize 
                        47                      10015                         60 
       postfieldsize_large                  postquote                  postredir 
                     30120                      10039                        161 
                  prequote                 prereqdata             prereqfunction 
                     10093                      10313                      20312 
                 pre_proxy                    private           progressfunction 
                     10262                      10103                      20056 
                 protocols              protocols_str                      proxy 
                       181                      10318                      10004 
                 proxyauth                proxyheader              proxypassword 
                       111                      10228                      10176 
                 proxyport                  proxytype              proxyusername 
                        59                        101                      10175 
              proxyuserpwd               proxy_cainfo          proxy_cainfo_blob 
                     10006                      10246                      40310 
              proxy_capath              proxy_crlfile           proxy_issuercert 
                     10247                      10260                      10296 
     proxy_issuercert_blob            proxy_keypasswd      proxy_pinnedpublickey 
                     40297                      10258                      10263 
        proxy_service_name              proxy_sslcert          proxy_sslcerttype 
                     10235                      10254                      10255 
        proxy_sslcert_blob               proxy_sslkey           proxy_sslkeytype 
                     40293                      10256                      10257 
         proxy_sslkey_blob           proxy_sslversion      proxy_ssl_cipher_list 
                     40294                        250                      10259 
         proxy_ssl_options       proxy_ssl_verifyhost       proxy_ssl_verifypeer 
                       261                        249                        248 
       proxy_tls13_ciphers     proxy_tlsauth_password         proxy_tlsauth_type 
                     10277                      10252                      10253 
    proxy_tlsauth_username        proxy_transfer_mode                        put 
                     10251                        166                         54 
                quick_exit                      quote                random_file 
                       322                      10028                      10076 
                     range                   readdata               readfunction 
                     10007                      10009                      20012 
           redir_protocols        redir_protocols_str                    referer 
                       182                      10319                      10016 
            request_target                    resolve        resolver_start_data 
                     10266                      10203                      10273 
   resolver_start_function                resume_from          resume_from_large 
                     20272                         21                      30116 
          rtsp_client_cseq               rtsp_request           rtsp_server_cseq 
                       193                        189                        194 
           rtsp_session_id            rtsp_stream_uri             rtsp_transport 
                     10190                      10191                      10192 
              sasl_authzid                    sasl_ir                   seekdata 
                     10289                        218                      10168 
              seekfunction    server_response_timeout server_response_timeout_ms 
                     20167                        112                        324 
              service_name                      share                sockoptdata 
                     10236                      10100                      10149 
           sockoptfunction                socks5_auth          socks5_gssapi_nec 
                     20148                        267                        180 
     socks5_gssapi_service             ssh_auth_types            ssh_compression 
                     10179                        151                        268 
           ssh_hostkeydata        ssh_hostkeyfunction    ssh_host_public_key_md5 
                     10317                      20316                      10162 
ssh_host_public_key_sha256                ssh_keydata            ssh_keyfunction 
                     10311                      10185                      20184 
            ssh_knownhosts        ssh_private_keyfile         ssh_public_keyfile 
                     10183                      10153                      10152 
                   sslcert                sslcerttype               sslcert_blob 
                     10025                      10086                      40291 
                 sslengine          sslengine_default                     sslkey 
                     10089                         90                      10087 
                sslkeytype                sslkey_blob                 sslversion 
                     10088                      40292                         32 
           ssl_cipher_list               ssl_ctx_data           ssl_ctx_function 
                     10083                      10109                      20108 
             ssl_ec_curves            ssl_enable_alpn             ssl_enable_npn 
                     10298                        226                        225 
            ssl_falsestart                ssl_options        ssl_sessionid_cache 
                       233                        216                        150 
  ssl_signature_algorithms             ssl_verifyhost             ssl_verifypeer 
                     10328                         81                         64 
          ssl_verifystatus                     stderr             stream_depends 
                       232                      10037                      10240 
          stream_depends_e              stream_weight   suppress_connect_headers 
                     10241                        239                        265 
              tcp_fastopen              tcp_keepalive                tcp_keepcnt 
                       244                        213                        326 
              tcp_keepidle              tcp_keepintvl                tcp_nodelay 
                       214                        215                        121 
             telnetoptions               tftp_blksize            tftp_no_options 
                     10070                        178                        242 
             timecondition                    timeout                 timeout_ms 
                        33                         13                        155 
                 timevalue            timevalue_large              tls13_ciphers 
                        34                      30270                      10276 
          tlsauth_password               tlsauth_type           tlsauth_username 
                     10205                      10206                      10204 
               trailerdata            trailerfunction               transfertext 
                     10284                      20283                         53 
         transfer_encoding           unix_socket_path          unrestricted_auth 
                       207                      10231                        105 
        upkeep_interval_ms                     upload          upload_buffersize 
                       281                         46                        280 
              upload_flags                        url                  useragent 
                       327                      10002                      10018 
                  username                    userpwd                    use_ssl 
                     10173                      10005                        119 
                   verbose              wildcardmatch                  writedata 
                        41                        197                      10001 
             writefunction                 ws_options               xferinfodata 
                     20011                        320                      10057 
          xferinfofunction             xoauth2_bearer 
                     20219                      10220 



> curl_version()
$version
[1] "8.14.1"

$headers
[1] "8.14.1"

$ssl_version
[1] "(OpenSSL/3.5.0) Schannel"

$libz_version
[1] "1.3"

$libssh_version
[1] "libssh2/1.11.0"

$libidn_version
[1] NA

$host
[1] "x86_64-w64-mingw32"

$protocols
 [1] "dict"    "file"    "ftp"     "ftps"    "gopher"  "gophers" "http"    "https"   "imap"   
[10] "imaps"   "ldap"    "ldaps"   "mqtt"    "pop3"    "pop3s"   "rtsp"    "scp"     "sftp"   
[19] "smb"     "smbs"    "smtp"    "smtps"   "telnet"  "tftp"    "ws"      "wss"    

$ipv6
[1] TRUE

$http2
[1] TRUE

$idn
[1] TRUE

$url_parser
[1] TRUE