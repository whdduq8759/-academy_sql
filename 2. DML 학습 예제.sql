--DML : ������ ���۾�
--SELECT, INSERT, UPDATE, DELETE


--������ ����
INSERT INTO BOARD
    (BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
    (1, '�ȳ�~', '��մ� �����Դϴ�.', '������', SYSDATE);
-- ���ڿ��� Ȭ����ǥ�� ����Ѵ� 

--NOT NULL �������ǿ� �ɸ�(TITLE)
INSERT INTO BOARD
    (BNO, CONTENT, WRITER, REG_DATE)
VALUES
    (1, '��մ� �����Դϴ�.', '������', SYSDATE);

--PK ������������ �۹�ȣ �ߺ�
INSERT INTO BOARD
    (BNO, TITLE, WRITER, REG_DATE)
VALUES
    (1, '���ο� ����', '�����', SYSDATE);

    
INSERT INTO BOARD
    (BNO, TITLE, WRITER, REG_DATE)
VALUES
    (2, '���ο� ����', '�����', SYSDATE);    
    
--���̺��� ��� �÷��� ������� ä�� ��� �÷������� ���� ����
INSERT INTO BOARD
VALUES
    (3, '3����', '�۳��볻���', '�Ѹ�', SYSDATE); 
    

    SELECT * FROM BOARD;

COMMIT;    
    
