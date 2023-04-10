CREATE DEFINER=`root`@`localhost` TRIGGER `student_AFTER_DELETE` AFTER DELETE ON `student` FOR EACH ROW BEGIN
INSERT INTO Student_Audit (sid, sname, m1, m2, m3, total, teacherid, action)
VALUES (OLD.sid, OLD.sname, OLD.m1, OLD.m2, OLD.m3, OLD.total, OLD.teacherid, 'delete');
END