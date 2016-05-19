package es.us.isa.ideas.test.app.pageobject.testcase;

import es.us.isa.ideas.test.app.utils.TestProperty;
import es.us.isa.ideas.test.app.pageobject.PageObject;
import es.us.isa.ideas.test.app.pageobject.login.RecoverPasswordPage;
import es.us.isa.ideas.test.app.pageobject.login.RegisterPage;
import es.us.isa.ideas.test.app.pageobject.login.RegisterSocialGooglePage;
import es.us.isa.ideas.test.app.pageobject.login.RegisterSocialTwitterPage;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runners.MethodSorters;

/**
 * Applied Software Engineering Research Group (ISA Group) University of
 * Sevilla, Spain
 *
 * @author Felipe Vieira da Cunha Serafim <fvieiradacunha@us.es>
 * @version 1.0
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class RegisterTestCase {

    @Test
    public void step01_registerFormFieldMaxLength() {
        String bigString = "1729374981723894719283749812734987192834719827398417293847198237489173417293749817238947192837498127349871928347198273984172938471982374891734172937498172389471928374981273498719283471982739841729384719823748917341729374981723894719283749812734987192834719827398417293847198237489173417293749817238947192837498127349871928347198273984172938471982374891734172937498172389471928374981273498719283471982739841729384719823748917341729374981723894719283749812734987192834719827398417293847198237489173417293749817238947192837498127349871928347198273984172938471982374891734";
        String name = bigString;
        String email = bigString;
        String phone = bigString;
        String address = bigString;

        RegisterPage.testRegisterWithErrors(name, email, phone, address);
    }

    @Test
    public void step02_twitterRegister() {
        String twUser = TestProperty.getTestTwitterUser();
        String twPass = TestProperty.getTestTwitterPassword();
        RegisterSocialTwitterPage.testTwitterSocialRegister(twUser, twPass);
    }

    @Ignore
    public void step06_googleRegister() {
        PageObject.logout();

        String goUser = TestProperty.getTestGoogleUser();
        String goPass = TestProperty.getTestGooglePassword();
        RegisterSocialGooglePage.testGoogleSocialRegister(goUser, goPass);
    }

    @Ignore
    public void step06_googleRegisterb() {
        RegisterSocialGooglePage.testGoogleSocialLogout();
    }

    @Test
    public void step10_register() {
        PageObject.logout();

        String user = TestProperty.getTestRegisterUser();
        String name = TestProperty.getTestRegisterUserName();
        String email = TestProperty.getTestRegisterUserEmail();
        String emailPass = TestProperty.getTestRegisterUserEmailPassword();
        String phone = TestProperty.getTestRegisterUserPhone();
        String address = TestProperty.getTestRegisterUserAddress();

        RegisterPage.testRegister(name, email, emailPass, phone, address, user);
    }

    @Test
    public void step12_recoverPassword() {
        PageObject.logout();

        String user = TestProperty.getTestRegisterUser();
        String email = TestProperty.getTestRegisterUserEmail();
        String emailPass = TestProperty.getTestRegisterUserEmailPassword();

        RecoverPasswordPage.testRecoverPassword(email, emailPass, user);
        PageObject.logout();
    }

}
