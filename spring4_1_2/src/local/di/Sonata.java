package local.di;

//@Scope는 6월에 할 예정
//import org.springframework.context.annotation.Scope;

//@Scope("singleton")
public class Sonata {

	private String	color	= null;
	private int		wheel	= 0;
	private int		speed	= 0;

	public Sonata() {
	}

	public Sonata(String color, int wheel) {
		this.color = color;
		this.wheel = wheel;
	}

	public Sonata(String color, int wheel, int speed) {
		this.color = color;
		this.wheel = wheel;
		this.speed = speed;
	}
	
	// @오버라이드를 통해 toString() 메소드 재정의
	@Override
	public String toString() {
		return "자동차 정보 출력하기 ===> 색상: "+color+", 바퀴 수: "+wheel+", 속력: "+speed;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getWheel() {
		return wheel;
	}

	public void setWheel(int wheel) {
		this.wheel = wheel;
	}

	public int getSpeed() {
		return speed;
	}

	public void setSpeed(int speed) {
		this.speed = speed;
	}
}
