CREATE DEFINER=`root`@`localhost` TRIGGER `student_AFTER_UPDATE` AFTER UPDATE ON `student` FOR EACH ROW BEGIN
INSERT INTO Student_Audit (sid, sname, m1, m2, m3, total, teacherid, action)
VALUES (NEW.sid, NEW.sname, NEW.m1, NEW.m2, NEW.m3, NEW.total, NEW.teacherid, 'update');
END