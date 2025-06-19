package dto;

import java.io.Serializable;
//import java.util.Date;

public class stampsDto extends CustomTemplateDto implements Serializable{
	private static final long serialVersionUID = 1L;

	private int cnt;
	private int totalScore;
	
    //--- 空コンストラクタ（ResultSet#next() 前に使う）---
    public stampsDto() { }

	
	//--- 集計結果を受け取るためのコンストラクタ ---
    public stampsDto(int cnt, int totalScore) {
        this.cnt        = cnt;
        this.totalScore = totalScore;
    }

	
        //--- getter / setter ---
        public int getCnt() {
            return cnt;
        }
        public void setCnt(int cnt) {
            this.cnt = cnt;
        }

        public int getTotalScore() {
            return totalScore;
        }
        public void setTotalScore(int totalScore) {
            this.totalScore = totalScore;
        }
    }
