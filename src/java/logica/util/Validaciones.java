package logica.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validaciones {
	
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
		    Pattern.compile("^((?!\\.)[\\w-_.]*[^.])(@\\w+)(\\.\\w+(\\.\\w+)?[^.\\W])$", Pattern.CASE_INSENSITIVE);

	/**
	 * Valida que la direccion email sea masomenos correcta mediante una expresion regular. 
	 * Por ej: Que no tenga espacios en blanco, que tenga solo un @, etc.
	 * @param email string
	 * @return true si es correcta, false si no lo es.
	 */
	public static boolean validaEmail(String email) {
	        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(email.trim().toLowerCase());
	        return matcher.find();
	}
	/**
	 * Valida que una cadena de texto sea de entre 4 y 99 caracteres y no contenga caracteres que no sean alfanumericos.
	 * @param campo String a validar. Por ej: un usuario o contraseña.
	 * @return True si el campo tiene entre 5 y 99 caracteres y no contiene caracteres raros. False en caso contrario.
	 */
	public static boolean validaCampo(String campo) {
		boolean ok = true;
		campo = campo.trim();
		String verdura = "!\"·$%&¿<>^`+´|#~€¬¡'";
		
		if (campo.length()<4 || campo.length()>99) {
			ok = false;
		}
		
		for (int i=0 ; i<verdura.length(); i++) {
			for (int j = 0; j < campo.length(); j++) {
				if(verdura.charAt(i)==campo.charAt(j)) {
					ok = false;
					break;
				}
			}
		}
		return ok;
	}
	
	/**
	 * Valida que un String, no contenga caracteres no deseados.
	 * @param campo
	 * @return true si no contiene caracteres raros, false de lo contrario.
	 */
	public static boolean validaCaracteres(String campo) {
		boolean ok = true;
		campo = campo.trim();
		String verdura = "!\"·$%&¿^<>`+´|#~€¬¡'";
		
		for (int i=0 ; i<verdura.length(); i++) {
			for (int j = 0; j < campo.length(); j++) {
				if(verdura.charAt(i)==campo.charAt(j)) {
					ok = false;
					break;
				}
			}
		}
		return ok;
	}
	
	/**
	 * Valida que un string de algun input/texbox sea un Double.
	 * @param num
	 * @return
	 */
	public static boolean validaNum(String num) {
		boolean ok = true;
		num = num.replace(",", ".");
		try {
			double numero = Double.parseDouble(num);
			ok = numero>=0?true:false;
		} catch (NumberFormatException e) {
			ok = false;
		}
		return ok;
	}
	
	/**
	 * Valida que un string de algun input/texbox sea un Long.
	 * @param num
	 * @return
	 */
	public static boolean validaNumLong(String num) {
		boolean ok = true;
		try {
			num = num.replace(",", ".");
			long numero = Long.parseLong(num);
			ok = numero>=0?true:false;
		} catch (NumberFormatException e) {
			ok = false;
		} catch (NullPointerException e) {
			ok = false;
		}
		return ok;
	}
	
	/**
	 * Valida que un string de algun input/texbox sea un Entero.
	 * @param num
	 * @return
	 */
	public static boolean validaNumInt(String num) {
		boolean ok = true;
		try {
			num = num.replace(",", ".");
			int numero = Integer.parseInt(num);
			ok = numero>=0?true:false;
		} catch (NumberFormatException e) {
			ok = false;
		} catch (NullPointerException e) {
			ok = false;
		}
		return ok;
	}
	
	/**
	 * Valida que un string de algun input/texbox sea un Double.
	 * @param num
	 * @return
	 */
	public static boolean validaNumDouble(String num) {
		boolean ok = true;
		try {
			num = num.replace(",", ".");
			double numero = Double.parseDouble(num);
			ok = numero>=0?true:false;
		} catch (NumberFormatException e) {
			ok = false;
		} catch (NullPointerException e) {
			ok = false;
		}
		return ok;
	}
	
	/** Recibe un string y devuelve el mismo numero en formato Double, reemplazando las comas por puntos.
	 * @param String numero
	 * @return Double numero, o -1 en caso de que no se pueda parsear.
	 */
	public static Double stringToDouble(String num) {
		boolean ok = true;
		double numero = 0;
		try {
			num = num.replace(",", ".");
			numero = Double.parseDouble(num);
			ok = numero>=0?true:false;
		} catch (NumberFormatException e) {
			ok = false;
		} catch (NullPointerException e) {
			ok = false;
		}
		
		return ok==true?numero:-1;
	}
	
	/**
	 * Se le pasa un string y lo retorna con la primera letra en Uppercase y las demas en Lowercase.
	 * @param campo
	 * @return
	 */
	public static String capitalize(String campo) {
		char char0 = campo.trim().toUpperCase().charAt(0);
		campo = campo.trim().substring(1).toLowerCase();
		return char0+campo;
	}
}