CREATE DEFINER=`root`@`localhost` TRIGGER `deleteteacher` AFTER DELETE ON `teacher` FOR EACH ROW BEGIN
UPDATE Student SET teacherid = NULL WHERE teacherid = OLD.teacherid;

END