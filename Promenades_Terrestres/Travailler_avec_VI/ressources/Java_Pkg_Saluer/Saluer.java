package Java_Pkg_Saluer;

public class Saluer {

		private String part_1, part_2;

		public static void main(String args[]) {
			String part_1 = Debut.premiere_partie();
			String part_2 = Fin.seconde_partie();
			System.out.println(part_1 + part_2);
		}
}
