/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-07-09 12:08:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(20) DEFAULT NULL,
  `album_time` date DEFAULT NULL,
  `album_islocked` varchar(1) DEFAULT NULL,
  `album_password` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `album_pic` text,
  PRIMARY KEY (`album_id`),
  KEY `album_ibfk_1` (`user_id`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('26', '风景', '2016-07-09', '否', null, '10', '/Blog/img/pic-none.png');
INSERT INTO `album` VALUES ('27', '萌宠', '2016-07-09', '否', null, '10', '/Blog/img/pic-none.png');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(50) DEFAULT NULL,
  `blog_content` text,
  `blog_time` date DEFAULT NULL,
  `blog_readtimes` int(11) unsigned zerofill DEFAULT '00000000000',
  `blog_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `blog_recommend` varchar(255) DEFAULT '否' COMMENT '是否为推荐博客',
  `blog_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `FK_Reference_14` (`user_id`),
  KEY `FK_Reference_15` (`blog_type_id`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('52', '说说js闭包', '<p>&nbsp; &nbsp;js闭包涉及到作用域，js的作用域有两种，全局变量和局部变量，全家变量就是在函数外声明的，局部变量是在函数内声明的，函数内部可以直接读取全局变量 ，但是函数外部自然无法读取函数内的局部变量（函数内部声明变量的时候，要用var不然就是个全局变量）有时候需要得到函数内的局部变量</p><p>滥用闭包会可能导致内存泄漏（由于闭包会使得函数中的变量都被保存在内存中，内存消耗很大，）所以在退出函数之前，将不使用的局部变量全部删除。</p><pre>function&nbsp;f1(){\r\n　　　　var&nbsp;n=999;\r\n　　　　nAdd=function(){n+=1}\r\n　　　　function&nbsp;f2(){\r\n　　　　　　alert(n);\r\n　　　　}\r\n　　　　return&nbsp;f2;\r\n　　}\r\n　　var&nbsp;result=f1();\r\n　　result();&nbsp;//&nbsp;999\r\n　　nAdd();\r\n　　result();&nbsp;//&nbsp;1000</pre><p><br/></p>', '2016-07-07', '00000000004', null, '10', '否', 'web前端精华');
INSERT INTO `blog` VALUES ('54', '《Linux系统编程》笔记 第四章(一)', '<h2>前言</h2><p>第二章介绍了称为文件I/O的一系列系统调用，这些系统调用是文件操作的基础。这章介绍Linux提供的更高级的文件I/O方式，包括新的I/O方式、更高级的I/O多路复用方式以及内存映射等等。通过本章的学习，可以更加灵活高效的使用系统调用进行文件操作。</p><h2><a></a>4.1 分散-聚合I/O</h2><p>分散-聚合I/O(scatter-gather I/O)还有很多别的叫法，例如分散输入、集中输出，向量I/O、散布/聚合I/O等等，这里指的是同一个I/O方式，都是从一个文件描述符中读取数据并拷贝到不同的用户空间缓冲区或从不同的用户空间缓冲区将数据写入到同一个文件描述符。与此相对的，前面章节介绍的I/O方式可以称作线性I/O。&nbsp;<br/>Linux提供了专门的系统调用(意味着是原子操作)来支持分散-聚合I/O，是对应文件I/O后面加上’v’(代表vector,向量)。</p><h3>writev()</h3><pre>#include&nbsp;&lt;sys/uio.h&gt;\r\nssize_t&nbsp;writev(int&nbsp;fd,&nbsp;const&nbsp;struct&nbsp;iovec&nbsp;*iov,&nbsp;int&nbsp;iovcnt);</pre><p><strong>struct iovec</strong>类型标明了缓冲区的地址和长度：</p><pre>//定义在&lt;sys/uio.h&gt;\r\nstruct&nbsp;iovec&nbsp;{&nbsp;&nbsp;&nbsp;\r\nvoid&nbsp;&nbsp;*iov_base;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;缓冲区地址&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;size_t&nbsp;iov_len;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;能操作的字节数&nbsp;*/\r\n};</pre><pre>#include&nbsp;&lt;sys/uio.h&gt;\r\n#include&nbsp;&lt;string.h&gt;\r\n#include&nbsp;&lt;stdio.h&gt;\r\n#include&nbsp;&lt;fcntl.h&gt;\r\n#include&nbsp;&lt;unistd.h&gt;\r\nint&nbsp;main()\r\n{&nbsp;&nbsp;&nbsp;&nbsp;char&nbsp;buf1[]=&quot;Failure&nbsp;is&nbsp;the&nbsp;mother&nbsp;of&nbsp;success.&quot;;&nbsp;&nbsp;&nbsp;&nbsp;\r\nchar&nbsp;buf2[]=&quot;——Thomas&nbsp;Paine\\n&quot;;&nbsp;&nbsp;&nbsp;&nbsp;struct&nbsp;iovec&nbsp;iovArr[2];\r\n&nbsp;&nbsp;&nbsp;&nbsp;iovArr[0].iov_base=buf1;\r\n&nbsp;&nbsp;&nbsp;&nbsp;iovArr[0].iov_len=strlen((char*)iovArr[0].iov_base);\r\n&nbsp;&nbsp;&nbsp;&nbsp;iovArr[1].iov_base=buf2;\r\n&nbsp;&nbsp;&nbsp;&nbsp;iovArr[1].iov_len=strlen((char*)iovArr[1].iov_base);&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;printf(&quot;writev():%ld&nbsp;bytes,buf1:%d,buf2:%d\\n&quot;,&nbsp;writev(STDOUT_FILENO,&nbsp;iovArr,&nbsp;2),strlen((char*)iovArr[0].iov_base),strlen((char*)iovArr[1].iov_base));&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*Failure&nbsp;is&nbsp;the&nbsp;mother&nbsp;of&nbsp;success.——Thomas&nbsp;Paine\r\n&nbsp;&nbsp;&nbsp;&nbsp;writev():50&nbsp;bytes,buf1:33,buf2:17*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;0;\r\n}</pre><h3>readv()</h3><pre>#include&nbsp;&lt;sys/uio.h&gt;\r\nssize_t&nbsp;readv(int&nbsp;fd,&nbsp;const&nbsp;struct&nbsp;iovec&nbsp;*iov,&nbsp;int&nbsp;iovcnt);</pre><p>其参数、返回值与writev()类似。读取时是按照iovec结构的顺序依次读取，只有上一个iovec结构读取到iov_len个数据之后，输入才会写入下一个结构，因此可能会出现有些结构没有值的情况。感兴趣的同学可以将上面writev()的测试函数修改一下，改为聚合输出到文件，再用readv()读取并显示，此处不再写代码了。</p><h3><a></a>分散-聚合I/O的优势</h3><p>其最大的优势就是能够在一个系统调用内操作不同的缓冲区，如果用传统的read()方式读取一整块数据，分别分配给不同的缓冲区，不光带来效率上的问题，还增加了代码的复杂度。&nbsp;<br/>其次是单个系统调用保证了原子性，在多线程环境下不需要考虑线程同步(当然，如果多个线程对用户空间的iovec结构做读写，还是要靠线程同步机制来保证可靠性的)。&nbsp;<br/>还有一些不那么普遍的好处，假设我们的程序通过某种依赖长度的协议做进程间通信，例如前8个字节保存某类信息，紧跟着的32个字节保存另一类信息。使用分散-聚合I/O可以一次性读出数据并按照长度分配到对应的缓冲区中。</p><h3><a></a>pwritev()和preadv()</h3><p>Linux还提供了与pwrite()/pread()类似的支持定位读写的系统调用(想了解pwrite()和pread()可以参考前面章节笔记)：</p><pre>#include&nbsp;&lt;sys/uio.h&gt;\r\nssize_t&nbsp;preadv(int&nbsp;fd,&nbsp;const&nbsp;struct&nbsp;iovec&nbsp;*iov,&nbsp;int&nbsp;iovcnt,&nbsp;off_t&nbsp;offset);\r\nssize_t&nbsp;pwritev(int&nbsp;fd,&nbsp;const&nbsp;struct&nbsp;iovec&nbsp;*iov,&nbsp;int&nbsp;iovcnt,&nbsp;off_t&nbsp;offset);</pre><p>这里再次强调一下，pwrite()系列的定位读写适合和多线程结合起来，因为定位读写系列函数并不改变进程中保存的文件读写位置，也就不存在多线程同步的问题了。</p>', '2016-07-07', '00000000002', null, '10', '是', 'Linux编程');
INSERT INTO `blog` VALUES ('56', '《Linux系统编程》笔记 第四章(二)', '<h2>4.2 Event Poll接口</h2><p>在学习第二章-I/O多路复用技术时提到了select()和poll()两个系统调用，这两个系统调用都能阻塞在多个文件描述符上，让出CPU资源，阻塞等待对应的文件读就绪、写就绪或者出现异常。但是上述两个系统调用都有一些潜在的问题(具体参看对应章节)，内核2.6以后引入了epoll()机制，解决了之前提到的问题，并引入了边沿触发机制。在I/O多路复用的模型上，epoll()是目前最优的方案。</p><h3><a></a>4.2.1 创建新的epoll实例</h3><p>创建epoll实例是使用epoll模型的第一步。</p><pre>#include&nbsp;&lt;sys/epoll.h&gt;int&nbsp;epoll_create(int&nbsp;size);12</pre><p>该函数打开并返回一个新的epoll文件描述符，后续的epoll操作都要用这个文件描述符来进行。参数size原本是用来指定返回的epoll文件描述符初始能监听多少个文件描述符，但是Linux内核会动态增加可监听的文件描述符数量，因此该参数在较新的内核版本上会被忽略。在2.6.27的内核版本中引入了新的系统调用<code>int epoll_create1(int flags);</code>,其作用与epoll_create()一样，参数flags表明新建的epoll文件描述符的属性，目前只支持<code>EPOLL_CLOEXEC</code>(与之前介绍open()时的FD_CLOEXEC标志作用一致，在exec()系列函数被调用时该文件描述符被自动关闭)。&nbsp;<br/>该调用在成功时返回epoll文件描述符的值，失败时返回-1并设置errno。&nbsp;<br/>需要注意的是epoll文件描述符也占用系统资源，因此不再使用时需要调用close()来关闭。与文件描述符一样，当一个epoll资源对应的所有文件描述符被关闭时时，内核会把对应的资源返回给系统。</p><h3><a></a>4.2.2 控制epoll</h3><p>在创建epoll实例后，我们可以使用返回的文件描述符来控制对哪些文件描述符以及对哪些事件做监听。</p><pre>#include&nbsp;&lt;sys/epoll.h&gt;int&nbsp;epoll_ctl(int&nbsp;epfd,&nbsp;int&nbsp;op,&nbsp;int&nbsp;fd,&nbsp;struct&nbsp;epoll_event&nbsp;*event);12</pre><p>在处理成功时返回0，失败时返回-1并设置errno。&nbsp;<br/><strong>epfd</strong>-已经打开的epoll文件描述符&nbsp;<br/><strong>op</strong>-对epfd和fd做什么操作</p><table><thead><tr><th>取值</th><th>含义</th></tr></thead><tbody><tr><td>EPOLL_CTL_ADD</td><td>将fd添加到epfd的兴趣列表[^1]中，即对fd做监听，监听事件在event参数中描述。重复对一个fd调用会得到EEXIST错误</td></tr><tr><td>EPOLL_CTL_MOD</td><td>将兴趣列表中的fd对应的epoll_event用event参数覆盖，修改不存在的fd会得到ENOENT错误</td></tr><tr><td>EPOLL_CTL_DEL</td><td>将fd从epfd的兴趣列表中移除，event参数被忽略。当fd被close()时会自动被移出epfd的兴趣列表。移除不存在的fd时会得到ENOENT错误</td></tr></tbody></table><p><strong>fd</strong>-要操作的文件描述符，对应的文件可以是FIFO、Socket、管道。消息队列、终端等，但是不能是普通文件或目录，否则得到EPERM错误。&nbsp;<br/><strong>event</strong>-监听的事件信息和预留用户数据&nbsp;<br/>struct epoll_event结构如下：</p><pre>typedef&nbsp;union&nbsp;epoll_data&nbsp;\r\n{&nbsp;&nbsp;&nbsp;void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*ptr;&nbsp;&nbsp;&nbsp;int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fd;\r\n&nbsp;&nbsp;&nbsp;uint32_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u32;\r\n&nbsp;&nbsp;&nbsp;uint64_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u64;\r\n}&nbsp;epoll_data_t;struct&nbsp;epoll_event&nbsp;\r\n{\r\n&nbsp;&nbsp;&nbsp;uint32_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;events;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;事件类型&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;epoll_data_t&nbsp;data;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;用户数据&nbsp;*/};12345678910111213</pre><p><strong>events</strong>代表监听的事件类型，主要包括</p><table><thead><tr><th>取值</th><th>含义</th></tr></thead><tbody><tr><td>EPOLLERR</td><td>文件出错，该事件默认被监听</td></tr><tr><td>EPOLLET</td><td>与其他标志做或运算，开启边沿触发</td></tr><tr><td>EPOLLHUP</td><td>文件被挂起，该事件默认被监听</td></tr><tr><td>EPOLLIN</td><td>文件写就绪</td></tr><tr><td>EPOLLONESHOT</td><td>与其他标志做或运算，监听一次就绪后该文件描述符不被监听。除非使用EPOLL_CTL_MOD来重新设置监听事件</td></tr><tr><td>EPOLLOUT</td><td>文件写就绪</td></tr><tr><td>EPOLLRDHUP</td><td>socket通信中对端关闭</td></tr><tr><td>EPOLLPRI</td><td>高优先级带外数据可读</td></tr></tbody></table><p><strong>epoll_data</strong>是一个union类型的数据[^2]。用来保存用户的自定义信息，在文件描述符就绪后该数据会返回给用户，常用的做法是将被监听的文件描述符赋值给epoll_event.data.fd。也可以在保证安全的前提下将处理函数的地址赋值给ptr。&nbsp;<br/>epoll_ctl()将感兴趣的文件描述符和监听事件拷贝到内核空间，这样只需要调用一次即可，而每次的select()和poll()调用则都需要将文件描述符信息拷贝到内核。由于epoll_ctl()增加的文件描述符占用了内核空间，因此Linux规定了一个监听文件描述符的最大数量，在文件<code>/proc/sys/fs/epoll/max_user_watches</code>中规定。</p><h3><a></a>4.2.3 等待epoll事件</h3><p>在创建epoll实例、修改epoll监听的文件描述符和事件后，就是真正的阻塞等待文件描述符就绪了。</p><pre>#include&nbsp;&lt;sys/epoll.h&gt;int&nbsp;epoll_wait(int&nbsp;epfd,&nbsp;struct&nbsp;epoll_event&nbsp;*events,&nbsp;int&nbsp;maxevents,&nbsp;int&nbsp;timeout);12</pre><p>epoll_wait()能够阻塞等待epfd的兴趣列表中的文件和事件就绪，超时时间是timeout毫秒。若未到超时时间有文件就绪，返回就绪文件的个数并将信息保存在events中。events是用户自行申请的一个数组，内容就是在epoll_ctl()时设置的信息，其最大元素由maxevents指定，即一次最多能通知多少个文件就绪。timeout参数是0时该调用不阻塞，查询后立即返回；为-1时表示没有超时时间。&nbsp;<br/>出错时返回-1并设置errno，超时时返回0。</p><p>正确的用法应该是在epoll_wait()返回后判断返回值，若返回值大于0则 遍历events数组，根据事件类型和fd做处理。现在可以看到epoll()和select()/poll()相比优势所在了，epoll()在有文件就绪后提供了只有我们需要关心的文件描述符的集合，而不用像后两者那样遍历全部文件描述符来确认哪个文件就绪了。&nbsp;<br/>下面的代码演示从标准输入中等待数据就绪并读取：</p><pre>#include&nbsp;&lt;stdio.h&gt;#include&nbsp;&lt;stdlib.h&gt;#include&nbsp;&lt;unistd.h&gt;#include&nbsp;&lt;string.h&gt;#include&nbsp;&lt;sys/epoll.h&gt;#define&nbsp;MAX_EVENTS&nbsp;3int&nbsp;main&nbsp;(void)\r\n{&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;nr_events,&nbsp;epfd;\r\n&nbsp;&nbsp;&nbsp;&nbsp;epfd&nbsp;=&nbsp;epoll_create(MAX_EVENTS);//参数是多少都无所谓，epoll能自动增加\r\n&nbsp;&nbsp;&nbsp;&nbsp;//分配存放就绪文件信息的数组\r\n&nbsp;&nbsp;&nbsp;&nbsp;struct&nbsp;epoll_event&nbsp;events[MAX_EVENTS]&nbsp;=&nbsp;{};&nbsp;&nbsp;&nbsp;&nbsp;struct&nbsp;epoll_event&nbsp;evt;&nbsp;&nbsp;&nbsp;&nbsp;//监听标准输入上的可读事件\r\n&nbsp;&nbsp;&nbsp;&nbsp;evt.events&nbsp;=&nbsp;EPOLLIN;\r\n&nbsp;&nbsp;&nbsp;&nbsp;evt.data.fd=STDIN_FILENO;&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;iRet&nbsp;=&nbsp;epoll_ctl(epfd,&nbsp;EPOLL_CTL_ADD,&nbsp;evt.data.fd,&nbsp;&amp;evt);&nbsp;&nbsp;&nbsp;&nbsp;if(iRet&nbsp;==&nbsp;-1)\r\n&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;perror(&quot;epoll_ctl&quot;);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;-1;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;//无超时等待标准输入可读\r\n&nbsp;&nbsp;&nbsp;&nbsp;nr_events&nbsp;=&nbsp;epoll_wait(epfd,&nbsp;events,&nbsp;MAX_EVENTS,&nbsp;-1);&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(nr_events&nbsp;&lt;&nbsp;0)\r\n&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;perror(&quot;epoll_wait&quot;);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;-1;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(int&nbsp;i&nbsp;=&nbsp;0;&nbsp;i&nbsp;&lt;&nbsp;nr_events;&nbsp;i++)\r\n&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char&nbsp;temp[1024]&nbsp;=&nbsp;{0};\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iRet&nbsp;=&nbsp;read(events[i].data.fd,&nbsp;temp,&nbsp;sizeof(temp));&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf(&quot;event=%ld&nbsp;on&nbsp;fd=%d,data:%s\\n&quot;,&nbsp;events[i].events,&nbsp;events[i].data.fd,&nbsp;temp);\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n}1234567891011121314151617181920212223242526272829303132333435363738</pre><p>当在等待文件就绪期间收到了一个信号，epoll_wait()会返回错误码EINTR。此时只需要再次调用epoll_wait()，上面的演示代码没有做特殊处理。</p><p>另外在多线程的场景下，一个线程在epoll_wait()的同时可以由另一个线程修改文件描述符，修改是立即生效的并且会影响epoll/_wait()。测试代码如下：</p><pre>//编译时要-lpthread，链接pthread库#include&nbsp;&lt;stdio.h&gt;#include&nbsp;&lt;stdlib.h&gt;#include&nbsp;&lt;pthread.h&gt;#include&nbsp;&lt;sys/epoll.h&gt;#include&nbsp;&lt;unistd.h&gt;#define&nbsp;MAX_EVENTS&nbsp;3void&nbsp;*thrd_func(void&nbsp;*arg);int&nbsp;epfd;int&nbsp;main()\r\n{\r\n&nbsp;&nbsp;&nbsp;&nbsp;pthread_t&nbsp;tid;&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;*thread_ret&nbsp;=&nbsp;NULL;&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;nr_events;\r\n&nbsp;&nbsp;&nbsp;&nbsp;epfd&nbsp;=&nbsp;epoll_create(MAX_EVENTS);&nbsp;&nbsp;&nbsp;&nbsp;struct&nbsp;epoll_event&nbsp;events[MAX_EVENTS]&nbsp;=&nbsp;{};&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(pthread_create(&amp;tid,NULL,thrd_func,NULL)!=0)\r\n&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf(&quot;Create&nbsp;thread&nbsp;error!\\n&quot;);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exit(1);\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;//启动一个线程后无超时等待标准输入可写\r\n&nbsp;&nbsp;&nbsp;&nbsp;//在线程中将标准输入加到epoll兴趣列表中\r\n&nbsp;&nbsp;&nbsp;&nbsp;nr_events&nbsp;=&nbsp;epoll_wait(epfd,&nbsp;events,&nbsp;MAX_EVENTS,&nbsp;-1);&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(nr_events&nbsp;&lt;&nbsp;0)\r\n&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;perror(&quot;epoll_wait&quot;);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;-1;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;//在另一个线程将标准输入添加到兴趣队列后，epoll_wait()立即返回\r\n&nbsp;&nbsp;&nbsp;&nbsp;printf(&quot;event=%ld&nbsp;on&nbsp;fd=%d,can&nbsp;write!\\n&quot;,&nbsp;events[0].events,&nbsp;events[0].data.fd);\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;pthread_join(tid,&nbsp;(void**)&amp;thread_ret&nbsp;);&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;0;\r\n}void&nbsp;*thrd_func(void&nbsp;*arg)\r\n{&nbsp;&nbsp;&nbsp;&nbsp;struct&nbsp;epoll_event&nbsp;evt;&nbsp;&nbsp;&nbsp;&nbsp;//监听标准输入上的可写事件，该事件应该立即就绪\r\n&nbsp;&nbsp;&nbsp;&nbsp;evt.events&nbsp;=&nbsp;EPOLLOUT;\r\n&nbsp;&nbsp;&nbsp;&nbsp;evt.data.fd=STDOUT_FILENO;\r\n&nbsp;&nbsp;&nbsp;&nbsp;sleep(3);//等待3秒再将标准输入加入兴趣列表\r\n&nbsp;&nbsp;&nbsp;&nbsp;printf(&quot;add&nbsp;fd!\\n&quot;);&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;iRet&nbsp;=&nbsp;epoll_ctl(epfd,&nbsp;EPOLL_CTL_ADD,&nbsp;evt.data.fd,&nbsp;&amp;evt);&nbsp;&nbsp;&nbsp;&nbsp;if(iRet&nbsp;==&nbsp;-1)\r\n&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;perror(&quot;epoll_ctl&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;pthread_exit(NULL);\r\n}</pre><p><br/></p>', '2016-07-07', '00000000002', null, '10', '是', 'Linux编程');
INSERT INTO `blog` VALUES ('57', 'MySql之分页优化', '<p>很多应用往往只展示最新或最热门的几条记录，但为了旧记录仍然可访问，所以就需要个分页的导航栏。然而，如何通过MySQL更好的实现分页，始终是比较令人头疼的问题。虽然没有拿来就能用的解决办法，但了解数据库的底层或多或少有助于优化分页查询。</p><p>我们先从一个常用但性能很差的查询来看一看。</p><pre>SELECT&nbsp;*FROM&nbsp;cityORDER&nbsp;BY&nbsp;id&nbsp;DESCLIMIT&nbsp;0,&nbsp;151234</pre><p>这个查询耗时0.00sec。So，这个查询有什么问题呢？实际上，这个查询语句和参数都没有问题，因为它用到了下面表的主键，而且只读取15条记录。</p><pre>CREATE&nbsp;TABLE&nbsp;city&nbsp;(\r\n&nbsp;&nbsp;id&nbsp;int(10)&nbsp;unsigned&nbsp;NOT&nbsp;NULL&nbsp;AUTO_INCREMENT,\r\n&nbsp;&nbsp;city&nbsp;varchar(128)&nbsp;NOT&nbsp;NULL,&nbsp;&nbsp;PRIMARY&nbsp;KEY&nbsp;(id)\r\n)&nbsp;ENGINE=InnoDB;12345</pre><p>真正的问题在于offset(分页偏移量)很大的时候，像下面这样：</p><pre>SELECT&nbsp;*FROM&nbsp;cityORDER&nbsp;BY&nbsp;id&nbsp;DESCLIMIT&nbsp;100000,&nbsp;15;1234</pre><p>上面的查询在有2M行记录时需要0.22sec，通过EXPLAIN查看SQL的执行计划可以发现该SQL检索了100015行，但最后只需要15行。大的分页偏移量会增加使用的数据，MySQL会将大量最终不会使用的数据加载到内存中。就算我们假设大部分网站的用户只访问前几页数据，但少量的大的分页偏移量的请求也会对整个系统造成危害。Facebook意识到了这一点，但Facebook并没有为了每秒可以处理更多的请求而去优化数据库，而是将重心放在将请求响应时间的方差变小。</p><p>对于分页请求，还有一个信息也很重要，就是总共的记录数。我们可以通过下面的查询很容易的获取总的记录数。</p><pre>SELECT&nbsp;COUNT(*)FROM&nbsp;city;12</pre><p>然而，上面的SQL在采用InnoDB为存储引擎时需要耗费9.28sec。一个不正确的优化是采用SQL_CALC_FOUND_ROWS,SQL_CALC_FOUND_ROWS可以在能够在分页查询时事先准备好符合条件的记录数，随后只要执行一句select FOUND_ROWS(); 就能获得总记录数。但是在大多数情况下，查询语句简短并不意味着性能的提高。不幸的是，这种分页查询方式在许多主流框架中都有用到，下面看看这个语句的查询性能。</p><pre>SELECT&nbsp;SQL_CALC_FOUND_ROWS&nbsp;*FROM&nbsp;cityORDER&nbsp;BY&nbsp;id&nbsp;DESCLIMIT&nbsp;100000,&nbsp;15;1234</pre><p>这个语句耗时20.02sec，是上一个的两倍。事实证明使用SQL_CALC_FOUND_ROWS做分页是很糟糕的想法。&nbsp;<br/>下面来看看到底如何优化。文章分为两部分，第一部分是如何获取记录的总数目，第二部分是获取真正的记录。</p><p>高效的计算行数</p><p>如果采用的引擎是MyISAM，可以直接执行COUNT(*)去获取行数即可。相似的，在堆表中也会将行数存储到表的元信息中。但如果引擎是InnoDB情况就会复杂一些，因为InnoDB不保存表的具体行数。&nbsp;<br/>我们可以将行数缓存起来，然后可以通过一个守护进程定期更新或者用户的某些操作导致缓存失效时，执行下面的语句：</p><pre>SELECT&nbsp;COUNT(*)FROM&nbsp;city\r\nUSE&nbsp;INDEX(PRIMARY);123</pre><p>获取记录</p><p>下面进入这篇文章最重要的部分，获取分页要展示的记录。上面已经说过了，大的偏移量会影响性能，所以我们要重写查询语句。为了演示，我们创建一个新的表“news”，按照时事性排序(最新发布的在最前面)，实现一个高性能的分页。为了简单，我们就假设最新发布的新闻的Id也是最大的。</p><pre>CREATE&nbsp;TABLE&nbsp;news(\r\n&nbsp;&nbsp;&nbsp;id&nbsp;INT&nbsp;UNSIGNED&nbsp;PRIMARY&nbsp;KEY&nbsp;AUTO_INCREMENT,\r\n&nbsp;&nbsp;&nbsp;title&nbsp;VARCHAR(128)&nbsp;NOT&nbsp;NULL)&nbsp;ENGINE=InnoDB;1234</pre><p>一个比较高效的方式是基于用户展示的最后一个新闻Id。查询下一页的语句如下，需要传入当前页面展示的最后一个Id。</p><pre>SELECT&nbsp;*FROM&nbsp;news&nbsp;WHERE&nbsp;id&nbsp;&lt;&nbsp;$last_idORDER&nbsp;BY&nbsp;id&nbsp;DESCLIMIT&nbsp;$perpage1234</pre><p>查询上一页的语句类似，只不过需要传入当前页的第一个Id，并且要逆序。</p><pre>SELECT&nbsp;*FROM&nbsp;news&nbsp;WHERE&nbsp;id&nbsp;&gt;&nbsp;$last_idORDER&nbsp;BY&nbsp;id&nbsp;ASCLIMIT&nbsp;$perpage1234</pre><p>上面的查询方式适合实现简易的分页，即不显示具体的页数导航，只显示“上一页”和“下一页”，例如博客中页脚显示“上一页”，“下一页”的按钮。但如果要实现真正的页面导航还是很难的,下面看看另一种方式。</p><pre>SELECT&nbsp;id\r\nFROM&nbsp;(&nbsp;&nbsp;&nbsp;SELECT&nbsp;id,&nbsp;((@cnt:=&nbsp;@cnt&nbsp;+&nbsp;1)&nbsp;+&nbsp;$perpage&nbsp;-&nbsp;1)&nbsp;%&nbsp;$perpage&nbsp;cnt\r\n&nbsp;&nbsp;&nbsp;FROM&nbsp;news&nbsp;\r\n&nbsp;&nbsp;&nbsp;JOIN&nbsp;(SELECT&nbsp;@cnt:=&nbsp;0)T&nbsp;&nbsp;&nbsp;WHERE&nbsp;id&nbsp;&lt;&nbsp;$last_id\r\n&nbsp;&nbsp;&nbsp;ORDER&nbsp;BY&nbsp;id&nbsp;DESC\r\n&nbsp;&nbsp;&nbsp;LIMIT&nbsp;$perpage&nbsp;*&nbsp;$buttons)WHERE&nbsp;cnt&nbsp;=&nbsp;0;12345678910</pre><p>通过上面的语句可以为每一个分页的按钮计算出一个offset对应的id。这种方法还有一个好处。假设，网站上正在发布一片新的文章，那么所有文章的位置都会往后移一位，所以如果用户在发布文章时换页，那么他会看见一篇文章两次。如果固定了每个按钮的offset Id，这个问题就迎刃而解了。Mark Callaghan发表过一篇类似的博客，利用了组合索引和两个位置变量，但是基本思想是一致的。</p><p>如果表中的记录很少被删除、修改，还可以将记录对应的页码存储到表中，并在该列上创建合适的索引。采用这种方式，当新增一个记录的时候，需要执行下面的查询重新生成对应的页号。</p><pre>SET&nbsp;p:=&nbsp;0;UPDATE&nbsp;news&nbsp;SET&nbsp;page=CEIL((p:=&nbsp;p&nbsp;+&nbsp;1)&nbsp;/&nbsp;$perpage)&nbsp;ORDER&nbsp;BY&nbsp;id&nbsp;DESC;12</pre><p>当然，也可以新增一个专用于分页的表，可以用个后台程序来维护。</p><pre>UPDATE&nbsp;pagination&nbsp;TJOIN&nbsp;(&nbsp;&nbsp;&nbsp;SELECT&nbsp;id,&nbsp;CEIL((p:=&nbsp;p&nbsp;+&nbsp;1)&nbsp;/&nbsp;$perpage)&nbsp;page&nbsp;&nbsp;&nbsp;FROM&nbsp;news&nbsp;&nbsp;&nbsp;ORDER&nbsp;BY&nbsp;id\r\n)CON&nbsp;C.id&nbsp;=&nbsp;T.idSET&nbsp;T.page&nbsp;=&nbsp;C.page;12345678</pre><p>现在想获取任意一页的元素就很简单了：</p><pre>SELECT&nbsp;*FROM&nbsp;news&nbsp;AJOIN&nbsp;pagination&nbsp;B&nbsp;ON&nbsp;A.id=B.IDWHERE&nbsp;page=$offset;1234</pre><p>还有另外一种与上种方法比较相似的方法来做分页，这种方式比较试用于数据集相对小，并且没有可用的索引的情况下—比如处理搜索结果时。在一个普通的服务器上执行下面的查询，当有2M条记录时，要耗费2sec左右。这种方式比较简单，创建一个用来存储所有Id的临时表即可(这也是最耗费性能的地方)。</p><pre>CREATE&nbsp;TEMPORARY&nbsp;TABLE&nbsp;_tmp&nbsp;(KEY&nbsp;SORT(random))SELECT&nbsp;id,&nbsp;FLOOR(RAND()&nbsp;*&nbsp;0x8000000)&nbsp;randomFROM&nbsp;city;ALTER&nbsp;TABLE&nbsp;_tmp&nbsp;ADD&nbsp;OFFSET&nbsp;INT&nbsp;UNSIGNED&nbsp;PRIMARY&nbsp;KEY&nbsp;AUTO_INCREMENT,&nbsp;DROP&nbsp;INDEX&nbsp;SORT,&nbsp;ORDER&nbsp;BY&nbsp;random;12345</pre><p>接下来就可以向下面一样执行分页查询了。</p><pre>SELECT&nbsp;*FROM&nbsp;_tmpWHERE&nbsp;OFFSET&nbsp;&gt;=&nbsp;$offsetORDER&nbsp;BY&nbsp;OFFSET\r\nLIMIT&nbsp;$perpage;12345</pre><p>简单来说，对于分页的优化就是。。。避免数据量大时扫描过多的记录。</p><p><br/></p>', '2016-07-07', '00000000002', null, '10', '是', 'Mysql');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `blogcom_id` int(11) NOT NULL AUTO_INCREMENT,
  `blogcom_content` text,
  `blogcom_time` datetime DEFAULT NULL,
  `blogcom_state` varchar(1) DEFAULT NULL,
  `blogcom_parentid` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `blogcom_userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`blogcom_id`),
  KEY `FK_Reference_16` (`blogcom_parentid`),
  KEY `FK_Reference_6` (`blog_id`),
  KEY `blogcom_userid` (`blogcom_userid`),
  CONSTRAINT `blog_comment_ibfk_1` FOREIGN KEY (`blogcom_userid`) REFERENCES `user` (`user_id`),
  CONSTRAINT `blog_comment_ibfk_2` FOREIGN KEY (`blogcom_parentid`) REFERENCES `blog_comment` (`blogcom_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_type
-- ----------------------------
DROP TABLE IF EXISTS `blog_type`;
CREATE TABLE `blog_type` (
  `blog_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_type_name` varchar(20) DEFAULT NULL,
  `blog_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`blog_type_id`),
  KEY `blog_user_id` (`blog_user_id`),
  CONSTRAINT `blog_type_ibfk_1` FOREIGN KEY (`blog_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_type
-- ----------------------------
INSERT INTO `blog_type` VALUES ('8', 'web前端精华', '10');
INSERT INTO `blog_type` VALUES ('9', 'Linux编程', '10');
INSERT INTO `blog_type` VALUES ('10', 'Mysql', '10');

-- ----------------------------
-- Table structure for message_comment
-- ----------------------------
DROP TABLE IF EXISTS `message_comment`;
CREATE TABLE `message_comment` (
  `messagecom_id` int(11) NOT NULL AUTO_INCREMENT,
  `messagecom_content` varchar(100) DEFAULT NULL,
  `messagecom_time` datetime DEFAULT NULL,
  `messagecom_state` varchar(1) DEFAULT '否',
  `messagecom_replyuserid` int(11) DEFAULT NULL,
  `messagecom_parentid` int(11) DEFAULT NULL,
  `message_userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`messagecom_id`),
  KEY `message_userid` (`message_userid`),
  KEY `message_comment_ibfk_2` (`messagecom_replyuserid`),
  KEY `messagecom_parentid` (`messagecom_parentid`),
  CONSTRAINT `message_comment_ibfk_1` FOREIGN KEY (`message_userid`) REFERENCES `user` (`user_id`),
  CONSTRAINT `message_comment_ibfk_2` FOREIGN KEY (`messagecom_replyuserid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_comment
-- ----------------------------
INSERT INTO `message_comment` VALUES ('21', '啊啊啊', '2016-07-09 11:54:54', '否', '10', '0', '10');
INSERT INTO `message_comment` VALUES ('22', '留言啦', '2016-07-09 11:55:03', '否', '10', '0', '10');
INSERT INTO `message_comment` VALUES ('23', '好运', '2016-07-09 11:55:15', '否', '10', '22', '10');
INSERT INTO `message_comment` VALUES ('24', 'zb', '2016-07-09 11:55:25', '否', '10', '23', '10');

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_path` varchar(100) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `FK_Reference_10` (`album_id`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES ('15', '/Blog/upload/image/20160709/1468036132000099620.jpg', '26');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `user_registertime` datetime DEFAULT NULL,
  `user_birthday` date DEFAULT NULL,
  `user_mail` varchar(30) DEFAULT NULL,
  `user_job` varchar(20) DEFAULT NULL,
  `user_sex` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10', 'zcd', '123456', '2016-07-07 15:42:40', '1996-07-12', '635727914@qq.com', '学生', '男');
INSERT INTO `user` VALUES ('11', 'zq', '123456', '2016-07-07 15:43:44', '2016-07-07', '456789132@qq.com', '经理', '男');
