package kr.co.morae.emuns;

public enum GbStateEnum {

	PROGRESS("����"),
	COMPLETE("�Ϸ�"),
	CANCEL("���");

    private final String state;
    GbStateEnum(String state) {
        this.state = state;
    }
    
    public String getState() {
    	return state;
    }

}
