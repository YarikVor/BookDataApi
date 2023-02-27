-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Лют 25 2023 р., 20:07
-- Версія сервера: 10.4.27-MariaDB
-- Версія PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `booksdb`
--

-- --------------------------------------------------------

--
-- Структура таблиці `book`
--

CREATE TABLE `book` (
  `Id` int(11) NOT NULL,
  `Title` varchar(128) NOT NULL,
  `Cover` blob NOT NULL,
  `Content` mediumtext NOT NULL,
  `Author` varchar(128) NOT NULL,
  `Genre` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `book`
--

INSERT INTO `book` (`Id`, `Title`, `Cover`, `Content`, `Author`, `Genre`) VALUES
(2, 'To Kill a Mockingbird', 0x89504e470d0a1a0a0000000d49484452000000800000008008020000004c5cf69c000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000024f49444154785eeddcd14dc3301440d1841df8416222166204166222247e18a2584a54558d933ebb766fdbdcf343041248beb55f53298c87c36110e765fe2a88016006801900961fc2e338ce57aa127f6be30ee822fe0a36402fc10606e828d2c000b0e221ec9df3b6e5d26daf58f10e888f977d5a2ef7f68a55be0d2dfd334f2cb8146bfba0fe3e60ed372a8937081d415fc3eb7ca598f8cb3a3a03960d767be604051b140c611b948a9cd2d7de072c1ba4ef685e8b5c83d39f26a1217cfadaff1cfee6ab1391d47b76b69ec971c58a778003b9896392e21d30c9ee03159956be7206b80f5ab97608eb4a0680190056398493b339ec54b8e86cc5ae1ac26ac5003003c00c003300cc003003c00c003300acef9df06e3fb58eac8677c277c100b01b1d41dfbfefd3c573fb78fb992e3c821e86016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900e633625df880c6c33000cc7fd8743b1e41f7c8003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c0033002c13e0ecf19864b7cfdadd407407d8a0138f20582640f6b1bdc44dd0437e07ac355073ab4750b6819ba0b9ad1960831bb830843d8b7abb10205936701334743940960d5a0905f020ea27ba036cd049c11164831ef2ffae66c3f2a33ad59956be7808bb0fdaaa79176483866a02243668a532805a291ec26acb1d801a867f3340bf889930cf7a0000000049454e44ae426082, 'The novel is renowned for its warmth and humor, despite dealing with the serious issues of rape and racial inequality.', 'Harper Lee', 'Fiction'),
(3, '1984', 0x89504e470d0a1a0a0000000d49484452000000800000008008020000004c5cf69c000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000024f49444154785eeddcd14dc3301440d1841df8416222166204166222247e18a2584a54558d933ebb766fdbdcf343041248beb55f53298c87c36110e765fe2a88016006801900961fc2e338ce57aa127f6be30ee822fe0a36402fc10606e828d2c000b0e221ec9df3b6e5d26daf58f10e888f977d5a2ef7f68a55be0d2dfd334f2cb8146bfba0fe3e60ed372a8937081d415fc3eb7ca598f8cb3a3a03960d767be604051b140c611b948a9cd2d7de072c1ba4ef685e8b5c83d39f26a1217cfadaff1cfee6ab1391d47b76b69ec971c58a778003b9896392e21d30c9ee03159956be7206b80f5ab97608eb4a0680190056398493b339ec54b8e86cc5ae1ac26ac5003003c00c003300cc003003c00c003300acef9df06e3fb58eac8677c277c100b01b1d41dfbfefd3c573fb78fb992e3c821e86016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900e633625df880c6c33000cc7fd8743b1e41f7c8003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c0033002c13e0ecf19864b7cfdadd407407d8a0138f20582640f6b1bdc44dd0437e07ac355073ab4750b6819ba0b9ad1960831bb830843d8b7abb10205936701334743940960d5a0905f020ea27ba036cd049c11164831ef2ffae66c3f2a33ad59956be7808bb0fdaaa79176483866a02243668a532805a291ec26acb1d801a867f3340bf889930cf7a0000000049454e44ae426082, 'The novel is set in a dystopian world where people are oppressed by a totalitarian regime that controls every aspect of their lives.', 'George Orwell', 'Science Fiction'),
(4, 'The Catcher in  the Rye', 0x89504e470d0a1a0a0000000d49484452000000800000008008020000004c5cf69c000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000025049444154785eeddcd14dc3301440d18601f864054660246662244660053e59a0584a54558d933cbb766fdbdcf343041248beb55f53290cc7e3f120cecbf4551003c00c0033002c3f84876198ae5425fed6c61dd045fc156c805e820d0cd051a4810160c543d83be775f3a55b5fb1e21d101f2ffb345feef515ab7c1b5afa679e58702996f641fd7dc0d26f54126f103a82be7e7ea72bc5c45fd6d119306fb0db332728d8a06008dba054e494bef63e60de207d47d35ae41a9cff34090de1f3d7fee7fbdb747526927acf2ed63339ad58f10e702037714a52bc0346d97da022e3ca57ce00f7412bd70e615dc9003003c02a87707231879d0a9b2e56ecaa21ac560c003300cc003003c00c003300cc003003c0fade09eff653ebc86a78277c170c00bbd11174fc7e1d2f9edbf0f1375e78043d0c03c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc67c4baf0018d87610098ffb0e9763c82ee9101600680190066009801600680190066009801600680190066009801600680190066009801600680190066009801600680190066009801600680190066009801600680190066005826c0c5e331c96e9fb5bb81e80eb041271e41b04c80ec637b899ba087fc0e586aa0e6168fa06c033741736b33c00637b031843d8b7adb0890cc1bb8091ada0e9065835642013c88fa89ee001b74527004d9a087fcbfab5931ffa84e75c6952f1ec2ee83b66ade05d9a0a19a00890d5aa90ca0568a87b0da7207a00e877f80cdd20a7f9b87070000000049454e44ae426082, 'The novel is about a teenager named Holden Caulfield, who experiences a range of emotions as he navigates through life.', 'J.D. Salinger', 'Fiction'),
(5, 'The Great Gatsby', 0x89504e470d0a1a0a0000000d49484452000000800000008008020000004c5cf69c000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000024d49444154785eeddcd16dc230144051d2bdf8ee08dda50374978ed06f06a39612219438e1d9d85c20f7fc346aa556f2c57e04291dcee7f3419c8fe9ab20068019006600587e080fc3305da94afcad8d3ba08bf82bd800bd041b18a0a3480303c08a87b077cedb964bb7bd62c53b203e5ef669b9dcdb2b56f936b4f4cfbcb1e052aced83fafb80b5dfa824de2074049d4ea7e94a31f1977574062c1becf6cc090a362818c236281539a5efbd0f583648dfd1b416b906d73f4d4243f8fab57f3c1ea7ab2b91d47b365bcfe4b262c53bc081dcc42549f10e1865f7818a8c2b5f3903dc07addc3b84752703c00c00ab1cc2c96c0e3b156e9aadd85d4358ad180066009801600680190066009801600680f5bd13deeda7d691d5f04ef8291800f6a023e8effb6bbc786f9f3fbfe38547d0cb3000cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c07c46ac0b1fd078190680f90f9b1ec723e8191900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006806502cc1e8f4976fbacdd034477800d3af108826502641fdb4bdc043de477c05a0335b77a04651bb8099adb9a013678801b43d8b3a8b71b01926503374143b70364d9a09550000fa27ea23bc0069d141c4136e821ffef6a362c3faa539d71e58b87b0fba0ad9a77413668a826406283562a03a895e221acb6dc01a8c3e11f0dffd230b4a2050d0000000049454e44ae426082, 'The novel is set in the roaring twenties and explores themes of love, wealth, and corruption.', 'F. Scott Fitzgerald', 'Fiction'),
(6, 'Pride and Prejudice', 0x89504e470d0a1a0a0000000d49484452000000800000008008020000004c5cf69c000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000025149444154785eeddc314ec3301840e1965b700f0636c4c691d9101b03f7e018c552a2aa4a9cf4b76bf7b5cdfb16229040f2abfd3795c2fe7038ecc4791abf0a62009801600680e587f07ebf1faf5425fed6c61dd045fc156c805e820d0cd051a4810160c543d83be775f3a55b5fb1e21d101f2fdb345feef515ab7c1b5afa671e58702996f641fd7dc0d26f54126f103a82de3e7ec72bc5c45fd6d119306fb0d9332728d8a06008dba054e494bef43e60de207d47e35ae41a9cfe34090de1d3d7fef7e7cb787522927acb26eb991c57ac780738909b382629de0183ec3e509161e52b6780fba0954b87b02e640098016095433899cc61a7c2599315bb6808ab1503c00c003300cc003003c00c003300cc00b0be77c29bfdd43ab21ade09df0403c0ae7404fd7cfd0d178fedf5fd79b8f008ba1b06801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098cf8875e1031a77c30030ff61d3f57804dd2203c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc00b04c80c9e331c9669fb5bb82e80eb041271e41b04c80ec637b899ba087fc0e586aa0e6168fa06c033741736b33c006577066087b16f5762640326fe02668e87c802c1bb4120ae041d44f7407d8a0938223c8063de4ff5dcd8af94775aa33ac7cf110761fb455f32ec8060dd504486cd04a6500b5523c84d5963b00b5dbfd03301ad41c604b363b0000000049454e44ae426082, 'The novel follows the main character, Elizabeth Bennet, as she navigates the social norms of her time and falls in love with the wealthy Mr. Darcy.', 'Jane Austen', 'Romance'),
(7, 'Brave New World', 0x89504e470d0a1a0a0000000d49484452000000800000008008020000004c5cf69c000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000056f49444154785eed9381891b5b10042f0267e0fc2370104ec4699c85bb1a767b7675d28ae319d445c17cdca339b61fffe3b32ca50fb0983ec062fa008be9032ce6f8013eca6bd0e303f401be0baafc8a3ec037429b77e9037c2f147a4e1fe07ba1d0739e7e0036ca09d4b481e0842bff07b0544ea0a60d04475c79801bec6d20783ff8fe0d047bc806171fe006abe5083ada43b6e7a107f8fcfd83ffdac06a39819af6906d78f401fa0617a0a63d64e68907e81b5c809a361098571fe006bf31fceb7b4317ffe09f3610fce3b90778f00d4a404d1b082e3cc0e11bf0b3720235ed21d2085831f1003709ca0b50b546c08a89f62559b90a556b04ac98a85e9295ab50b546c08a89ea2559b90a556b04ac98a85e9295ab50b546c08a89ea259989b44e69ca50b546c08a894392cc445aa73465a85a2360c5c421496622ad539a3254ad11b062e290243391d6294d19aad60858317148929948eb94a60c556b04ac983824c94ca4754a5386aa3502564c1c926426d23aa52943d51a012b260e493213699dd294a16a8d80151387249989b44e69ca50b546c08a894392cc445aa73465a85a2360c5c4214966229564ef47f420c90c556b04ac983824c94ca492ecfd881e2499a16a8d801513872499895492bd1fd183243354ad11b062e2902433914ab28f8f5f7f7ebe837c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957c6d1f60957ced7ff800ef46f420c90c556b04ac983824c94ca492ecfd881e2499a16a8d801513872499895492bd1fd183243354ad11b062e290243391d6294d19aad60858317148929948eb94a60c556b04ac983824c94ca4754a5386aa3502564c1c926426d23aa52943d51a012b260e493213699dd294a16a8d80151387249989b44e69ca50b546c08a894392cc445aa73465a85a2360c5c421496622ad539a3254ad11b062e290243391d6294d19aad60858317148929948eb94a60c556b04ac983824c94ca4754a5386aa3502564c1c926426d23aa52943d51a012b260e493213699dd294a16a8d80151387249989b44e69ca50b546c08a894392cc445aa73465a85a2360c5c421496622ad539a3254ad11b062e290243391d6294d19aad60858317148929948eb94a60c556b04ac983824c94ca4754a5386aa3502564c1c926426d23aa52943d51a012b260e493213699dd294a16a8d80151387249989b44e69ca50b546c08a894392cc445aa73465a85a2360c5c421496622ad539a3254ad11b062e290243391d6294d19aad60858317148929948eb94a60c556b04ac983824c94ca4754a5386aa3502564c1c926426d23aa52943d51a012b260e493213699dd294a16a8d80151387249989b44e69ca50b546c08a894392cc445aa73465a85a2360c5c421496622ad539a3254ad11b062e290243391d6294d19aad60858317148929948eb94a60c556b6c21df13b76e129848eb94a60c6d6b6c211f7c716e9fd6294d19dad6d8423ef8e2dc3ead539a32b4ad11b032b8776e13d54369ca50b5c684ad3df7ce6da27a284d197ad63884c53da7e7367fa91e4a53869235ce6077cff1b9fd1fab539a3234ac7107d6371c9fdbffb13aa52943bd1af7e1171b0ece8dbf57439a3274ab711f7e7197f863754a53866e35be841f9d137fac4e69ca50acc623f0bb13e28fd5294d195ad578107e7a44fcb13aa52943a51a8fc3afcbcbd0a7c65370a0bc06656a3c0b37ca0bd0a4c6053853ae428d1a17e04cb90a356a9455f40196f2f9f917bcabe9bde87fbdfa0000000049454e44ae426082, 'The novel is set in a future world where people are genetically engineered and conditioned to conform to society.', 'Aldous Huxley', 'Science Fiction'),
(8, 'Animal Farm', 0x89504e470d0a1a0a0000000d49484452000000800000008008020000004c5cf69c000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000024f49444154785eeddcd14dc3301440d1841df8416222166204166222247e18a2584a54558d933ebb766fdbdcf343041248beb55f53298c87c36110e765fe2a88016006801900961fc2e338ce57aa127f6be30ee822fe0a36402fc10606e828d2c000b0e221ec9df3b6e5d26daf58f10e888f977d5a2ef7f68a55be0d2dfd334f2cb8146bfba0fe3e60ed372a8937081d415fc3eb7ca598f8cb3a3a03960d767be604051b140c611b948a9cd2d7de072c1ba4ef685e8b5c83d39f26a1217cfadaff1cfee6ab1391d47b76b69ec971c58a778003b9896392e21d30c9ee03159956be7206b80f5ab97608eb4a0680190056398493b339ec54b8e86cc5ae1ac26ac5003003c00c003300cc003003c00c003300acef9df06e3fb58eac8677c277c100b01b1d41dfbfefd3c573fb78fb992e3c821e86016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900e633625df880c6c33000cc7fd8743b1e41f7c8003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c0033002c13e0ecf19864b7cfdadd407407d8a0138f20582640f6b1bdc44dd0437e07ac355073ab4750b6819ba0b9ad1960831bb830843d8b7abb10205936701334743940960d5a0905f020ea27ba036cd049c11164831ef2ffae66c3f2a33ad59956be7808bb0fdaaa79176483866a02243668a532805a291ec26acb1d801a867f3340bf889930cf7a0000000049454e44ae426082, 'The novel is an allegory that explores the dangers of totalitarianism and the importance of freedom and individualism.', 'George Orwell', 'Political Satire'),
(9, 'The Hobbit', 0x89504e470d0a1a0a0000000d49484452000000800000008008020000004c5cf69c000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000025049444154785eeddcd14dc3301440d18601f864054660246662244660053e59a0584a54558d933cbb766fdbdcf343041248beb55f53290cc7e3f120cecbf4551003c00c0033002c3f84876198ae5425fed6c61dd045fc156c805e820d0cd051a4810160c543d83be775f3a55b5fb1e21d101f2ffb345feef515ab7c1b5afa679e58702996f641fd7dc0d26f54126f103a82be7e7ea72bc5c45fd6d119306fb0db332728d8a06008dba054e494bef63e60de207d47d35ae41a9cff34090de1f3d7fee7fbdb747526927acf2ed63339ad58f10e702037714a52bc0346d97da022e3ca57ce00f7412bd70e615dc9003003c02a87707231879d0a9b2e56ecaa21ac560c003300cc003003c00c003300cc003003c0fade09eff653ebc86a78277c170c00bbd11174fc7e1d2f9edbf0f1375e78043d0c03c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc67c4baf0018d87610098ffb0e9763c82ee9101600680190066009801600680190066009801600680190066009801600680190066009801600680190066009801600680190066009801600680190066009801600680190066005826c0c5e331c96e9fb5bb81e80eb041271e41b04c80ec637b899ba087fc0e586aa0e6168fa06c033741736b33c00637b031843d8b7adb0890cc1bb8091ada0e9065835642013c88fa89ee001b74527004d9a087fcbfab5931ffa84e75c6952f1ec2ee83b66ade05d9a0a19a00890d5aa90ca0568a87b0da7207a00e877f80cdd20a7f9b87070000000049454e44ae426082, 'The novel is a prequel to The Lord of the Rings trilogy and follows the journey of the hobbit Bilbo Baggins as he seeks to reclaim treasure from a dragon.', 'J.R.R. Tolkien', 'Fantasy'),
(10, 'The Da Vinci Code', 0x89504e470d0a1a0a0000000d49484452000000800000008008020000004c5cf69c000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000024d49444154785eeddcd16dc230144051d2bdf8ee08dda50374978ed06f06a39612219438e1d9d85c20f7fc346aa556f2c57e04291dcee7f3419c8fe9ab20068019006600587e080fc3305da94afcad8d3ba08bf82bd800bd041b18a0a3480303c08a87b077cedb964bb7bd62c53b203e5ef669b9dcdb2b56f936b4f4cfbcb1e052aced83fafb80b5dfa824de2074049d4ea7e94a31f1977574062c1becf6cc090a362818c236281539a5efbd0f583648dfd1b416b906d73f4d4243f8fab57f3c1ea7ab2b91d47b365bcfe4b262c53bc081dcc42549f10e1865f7818a8c2b5f3903dc07addc3b84752703c00c00ab1cc2c96c0e3b156e9aadd85d4358ad180066009801600680190066009801600680f5bd13deeda7d691d5f04ef8291800f6a023e8effb6bbc786f9f3fbfe38547d0cb3000cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c07c46ac0b1fd078190680f90f9b1ec723e8191900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006806502cc1e8f4976fbacdd034477800d3af108826502641fdb4bdc043de477c05a0335b77a04651bb8099adb9a013678801b43d8b3a8b71b01926503374143b70364d9a09550000fa27ea23bc0069d141c4136e821ffef6a362c3faa539d71e58b87b0fba0ad9a77413668a826406283562a03a895e221acb6dc01a8c3e11f0dffd230b4a2050d0000000049454e44ae426082, 'The novel follows symbologist Robert Langdon as he investigates a murder and uncovers a conspiracy involving the Catholic Church.', 'Dan Brown', 'Thriller'),
(11, 'Harry Potter and the Philosopher\'s Stone', 0x89504e470d0a1a0a0000000d49484452000000800000008008020000004c5cf69c000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000025149444154785eeddc314ec3301840e1965b700f0636c4c691d9101b03f7e018c552a2aa4a9cf4b76bf7b5cdfb16229040f2abfd3795c2fe7038ecc4791abf0a62009801600680e587f07ebf1faf5425fed6c61dd045fc156c805e820d0cd051a4810160c543d83be775f3a55b5fb1e21d101f2fdb345feef515ab7c1b5afa671e58702996f641fd7dc0d26f54126f103a82de3e7ec72bc5c45fd6d119306fb0d9332728d8a06008dba054e494bef43e60de207d47e35ae41a9cfe34090de1d3d7fef7e7cb787522927acb26eb991c57ac780738909b382629de0183ec3e509161e52b6780fba0954b87b02e640098016095433899cc61a7c2599315bb6808ab1503c00c003300cc003003c00c003300cc00b0be77c29bfdd43ab21ade09df0403c0ae7404fd7cfd0d178fedf5fd79b8f008ba1b06801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098016006801900660098cf8875e1031a77c30030ff61d3f57804dd2203c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc003003c00c003300cc00b04c80c9e331c9669fb5bb82e80eb041271e41b04c80ec637b899ba087fc0e586aa0e6168fa06c033741736b33c006577066087b16f5762640326fe02668e87c802c1bb4120ae041d44f7407d8a0938223c8063de4ff5dcd8af94775aa33ac7cf110761fb455f32ec8060dd504486cd04a6500b5523c84d5963b00b5dbfd03301ad41c604b363b0000000049454e44ae426082, 'The novel follows the young wizard Harry Potter as he attends Hogwarts School of Witchcraft and Wizardry and learns about his magical heritage.', 'J.K. Rowling', 'Fantasy'),
(15, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(16, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(17, 'wrewe', 0xb2dae29e, 'string', 'string', 'string'),
(18, 'r', 0xb2dae29e, 'string', 'string', 'string'),
(19, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(20, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(21, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(22, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(23, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(24, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(25, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(26, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(27, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(28, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(29, 'string', 0xb2dae29e, 'string', 'string', 'string'),
(32, '2w', 0x7b, '2w', '2w', 'w2'),
(33, '2w', 0x7b, '2w', '2w', 'w2'),
(35, 'ebf9c2e2-2e33-476e-b8f1-05419ceba987', '', '2w', '2w', 'w2'),
(37, 'c1e56781-0b1e-4911-b26c-fb2cbeea94cb', '', '2w', '2w', 'w2');

-- --------------------------------------------------------

--
-- Структура таблиці `rating`
--

CREATE TABLE `rating` (
  `Id` int(11) NOT NULL,
  `BookId` int(11) NOT NULL,
  `Score` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `rating`
--

INSERT INTO `rating` (`Id`, `BookId`, `Score`) VALUES
(2, 7, 5),
(3, 4, 1),
(4, 2, 5),
(5, 2, 5),
(6, 2, 3),
(7, 5, 2),
(8, 10, 2),
(9, 8, 3),
(10, 11, 5),
(11, 8, 2),
(12, 2, 5),
(13, 10, 2),
(14, 9, 1),
(15, 3, 3),
(16, 5, 1),
(17, 2, 2),
(18, 4, 3),
(19, 4, 1),
(20, 4, 3),
(21, 4, 1),
(33, 3, 1),
(34, 3, 1),
(35, 3, 4),
(36, 3, 3),
(37, 2, 5),
(38, 2, 5),
(39, 3, 4),
(40, 2, 1),
(41, 3, 3),
(42, 2, 5),
(43, 2, 1),
(44, 2, 2),
(45, 3, 3),
(46, 2, 5),
(47, 2, 5),
(48, 2, 4),
(49, 2, 3),
(50, 3, 1),
(51, 2, 1),
(52, 2, 2),
(64, 2, 1),
(65, 2, 1),
(66, 2, 3),
(67, 2, 2),
(68, 3, 2),
(69, 2, 3),
(70, 3, 2),
(71, 3, 5),
(72, 3, 1),
(73, 3, 3),
(74, 3, 3),
(75, 2, 5),
(76, 3, 2),
(77, 3, 5),
(78, 2, 4),
(79, 2, 4),
(80, 3, 5),
(81, 2, 4),
(82, 2, 5),
(83, 3, 3),
(84, 2, 5),
(85, 3, 2),
(86, 2, 3),
(87, 3, 3),
(88, 2, 3),
(89, 2, 2),
(90, 2, 1),
(91, 3, 3),
(92, 3, 3),
(93, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `review`
--

CREATE TABLE `review` (
  `Id` int(11) NOT NULL,
  `Message` varchar(512) NOT NULL,
  `BookId` int(11) NOT NULL,
  `Reviewer` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `review`
--

INSERT INTO `review` (`Id`, `Message`, `BookId`, `Reviewer`) VALUES
(1, 'Цікава книга. Рекомендую.', 2, 'Олександр Бондаренко'),
(2, 'Прекрасний твір! Обов\'язково прочитайте.', 3, 'Наталія Шевченко'),
(3, 'Нудна книга, не раджу.', 4, 'Іван Петренко'),
(4, 'Хороша книга для відпочинку.', 5, 'Марія Коваленко'),
(5, 'Дуже цікава книга. Рекомендую!', 6, 'Віктор Сидоренко'),
(6, 'Жахлива книга, не раджу.', 7, 'Оксана Шевчук'),
(7, 'Дуже гарна книга. Не пропустіть!', 8, 'Андрій Михайленко'),
(8, 'Захоплююча історія. Обов\'язково прочитайте.', 9, 'Світлана Коваль'),
(9, 'Чудова книга! Рекомендую всім.', 10, 'Олексій Савченко'),
(10, 'Супер книга! Дуже сподобалась.', 11, 'Ірина Литвиненко'),
(13, 'Test', 2, 'Test'),
(14, 'Test', 2, 'Test'),
(15, 'Test', 2, 'Test'),
(16, 'Test', 2, 'Test'),
(17, 'Test', 2, 'Test'),
(18, 'Test', 2, 'Test'),
(19, '', 2, ''),
(20, '123', 2, '123'),
(21, '123', 2, '123');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Id`);

--
-- Індекси таблиці `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BookId` (`BookId`);

--
-- Індекси таблиці `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BookId` (`BookId`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `book`
--
ALTER TABLE `book`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблиці `rating`
--
ALTER TABLE `rating`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT для таблиці `review`
--
ALTER TABLE `review`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`BookId`) REFERENCES `book` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`BookId`) REFERENCES `book` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;