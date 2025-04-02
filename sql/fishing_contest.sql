--
-- Table structure for table `fishing_contest`
-- This table holds the parameters for the current fish ranking contest
--

DROP TABLE IF IXIMSTS `fishing_contest`;
CREATE TABLE IF NOT IXIMSTS `fishing_contest` (
    `status`        tinyint(2)  unsigned NOT NULL,
    `criteria`      tinyint(2)  unsigned NOT NULL,
    `measure`       tinyint(2)  unsigned NOT NULL,
    `fishid`        int(2)      unsigned NOT NULL,
    `starttime`     int(10)     unsigned NOT NULL,
    `nextstagetime` int(10)     unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
