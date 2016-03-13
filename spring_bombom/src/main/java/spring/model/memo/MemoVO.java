package spring.model.memo;
public class MemoVO {
/*
  memono  NUMBER(6)     NOT NULL,  -- 일련번호, -999999 ~ +999999 
  title   VARCHAR(100)  NOT NULL,  -- 메모 제목, 한글 50자 
  content VARCHAR(4000) NOT NULL,  -- 내용  
  wdate   DATE          NOT NULL,  -- 등록 날짜  
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, -99999 ~ +99999   
  */
  
  private int memono;
  private String title;
  private String content;
  private String wdate;
  private int viewcnt;
  
  public int getMemono() {
    return memono;
  }
  public void setMemono(int memono) {
    this.memono = memono;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getWdate() {
    return wdate;
  }
  public void setWdate(String wdate) {
    this.wdate = wdate;
  }
  public int getViewcnt() {
    return viewcnt;
  }
  public void setViewcnt(int viewcnt) {
    this.viewcnt = viewcnt;
  }
  
  
}