import java.util.Iterator;

import kr.or.kosa.Card;

public class Ex08_Static_Card {

	public static void main(String[] args) {
		
		Card c1 = new Card();
		c1.makeCard(1, "Heart");
		c1.cardDisplay();
		
		Card c2 = new Card();
		c2.makeCard(2, "Dia");
		c2.cardDisplay();
		
		Card c3 = new Card();
		c3.makeCard(3, "Spade");
		c3.cardDisplay();
		
		Card c = new Card();
		c.cardSizeChange(39, 24);
		
		c1.makeCard(1, "Heart");
		c1.cardDisplay();
		
		c2.makeCard(2, "Dia");
		c2.cardDisplay();
		
		c3.makeCard(3, "Spade");
		c3.cardDisplay();
		
	}

}
