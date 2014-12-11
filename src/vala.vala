namespace Config {
	public const string DEVELOPMENT_MODE   = "ON";
	public const string GETTEXT_PACKAGE    = "intlapp";
	public const string PACKAGE_LOCALE_DIR = "/usr/local/share/locale/";
	public const string PROJECT_DIR = "/home/usuario/Descargas/P9";


	#define _(x) gettext(x)

	class Calculadora
	{
		public double dividir(float param1,float param2)
		requires(param2 != 0 && param1 != 0)
		ensures(result != 0)
		{
			return param1/param2;
		}	
	}

	int main(string[] args) {
		string localedir;

		if (Config.DEVELOPMENT_MODE == "ON") {
			localedir = "po";
		} else {
			localedir = Config.PACKAGE_LOCALE_DIR;
		}
		Intl.setlocale (LocaleCategory.MESSAGES, "");

		Intl.bindtextdomain (Config.GETTEXT_PACKAGE, localedir);
		Intl.bind_textdomain_codeset (Config.GETTEXT_PACKAGE, "UTF-8");
		Intl.textdomain (Config.GETTEXT_PACKAGE);


		Calculadora calc = new Calculadora();
		stdout.printf ( _("Calculando una division de 4 entre 0\n") );
		stdout.printf ( _("El resultado es: %g\n"),calc.dividir(4,0) );
		return 0;
	}
}
