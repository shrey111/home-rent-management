package com.uwindsor.project.configs;

/*
 * 1) WebAppInitializer is actually you web.xml in xml based configurations
 * 2) To make a class WebAppInitializer you need to implement WebApplicationInitializer interface
 * 3) You have to override onStartup() method when you implement WebApplicationInitializer interface
 * 4) The Spring Web model-view-controller (MVC) framework is designed around a DispatcherServlet that handles all the HTTP requests and responses.
 * 5) After receiving an HTTP request, DispatcherServlet consults the HandlerMapping to call the appropriate Controller.
 * 6) The Controller takes the request and calls the appropriate service methods based on used GET or POST method. 
 *    The service method will set model data based on defined business logic and returns view name to the DispatcherServlet.
 * 7) The DispatcherServlet will take help from ViewResolver to pickup the defined view for the request.
 * 8) Once view is finalized, The DispatcherServlet passes the model data to the view which is finally rendered on the browser.
 */

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
/**
 * @author Afnan Ur Rehman
 */
public class WebAppInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext container) throws ServletException {
		// TODO Auto-generated method stub

		// Create the 'root' Spring application context
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		rootContext.register(WebConfig.class);//Set your config location
		
		//The below commented code line scans the entire package for configuration files.
		//rootContext.setConfigLocation("springmvc.java.config");

		/*
		 * If you do not want to go with default filename and default location as WebContent/WEB-INF, 
		 *  you can customize this file name and location by adding the Listener ContextLoaderListener in your WebAppInitializer.
		 *  We can add a listener to the ServletContext to load the context
		 */
		container.addListener(new ContextLoaderListener(rootContext));

		// Create the dispatcher servlet's Spring application context
		// DispatcherServlet's purpose is to intercept HTTP requests and to dispatch them to the right component that will know how to handle it.
		DispatcherServlet dispatcherServlet = new DispatcherServlet(rootContext);
		
		//Upon initialization of WebConfig DispatcherServlet, the framework will try to load the application context from WebConfig class.
		ServletRegistration.Dynamic registration = container.addServlet("dispatcherServlet", dispatcherServlet);

		/*
		 * load-on-startup is an integer value that specifies the order for multiple servlets to be loaded. 
		 * So if you need to declare more than one servlet you can define in which order they will be initialized. 
		 * Servlets marked with lower integers are loaded before servlets marked with higher integers.
		 */
		registration.setLoadOnStartup(1);
		//Next, addMapping function indicates what URLs will be handled by which DispatcherServlet. Its handler mapping.
		registration.addMapping("/"); //You need to map requests that you want the DispatcherServlet to handle, by using a URL mapping in WebAppInitializer.
		//Here all the HTTP requests ending with .jsp will be handled by the WebConfig DispatcherServlet.
	}

}
