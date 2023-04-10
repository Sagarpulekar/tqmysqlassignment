CREATE DEFINER=`root`@`localhost` TRIGGER `teacher_AFTER_UPDATE` AFTER UPDATE ON `teacher` FOR EACH ROW BEGIN
UPDATE Student SET teacherid = NEW.teacherid WHERE teacherid = OLD.teacherid;

END