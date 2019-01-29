package com.uwindsor.project.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
/**
 * @author Afnan Ur Rehman
 */
/*
 * 1) Configuration class dispatcher-servlet.xml
 * 2) The @ComponentScan annotation will be use to activate Spring MVC annotation scanning capability
 *    which allows to make use of annotations like @Controller and @RequestMapping etc.
 * 3) In Spring Web MVC, DispatcherServlet class works as the front controller. 
 *    It is responsible to manage the flow of the spring mvc application.
 * 4) Annotating a class with the @Configuration indicates that the class can be used by the Spring IoC container 
 *    as a source of bean definitions.
 * 5) The @Bean annotation tells Spring that a method annotated with @Bean will return an object that should be registered as a bean 
 *    in the Spring application context. 
 * 6) By default, the bean name will be the same as the method name.   
 * 7) The @Import annotation allows for loading @Bean definitions from another configuration class.
 * 8) @EnableWebMvc in java and <mvc:annotation-driven /> in xml are same thing.
 */
@EnableWebMvc
@Configuration
@ComponentScan(basePackages = { "com.uwindsor.project" })
@Import({ DataSourceConfig.class })
@PropertySource("classpath:DatabaseConfig.properties")
public class WebConfig extends WebMvcConfigurerAdapter implements WebMvcConfigurer{

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		// TODO Auto-generated method stub
		// Configure and map index page, so that when user types "/" he is
		// routed to index.jsp page.
		registry.addViewController("/").setViewName("index");
		//registry.addViewController("/newcoordinates.html").setViewName("/setcoordinates");

		super.addViewControllers(registry);
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		/*
		 * Defines how Spring will look for the view template. The
		 * InternalResourceViewResolver will have rules defined to resolve the
		 * view names. As per the defined rule, a logical view named hello is
		 * delegated to a view implementation located at /WEB-INF/jsp/hello.jsp
		 * Here, the InternalResourceViewResolver class is used for the
		 * ViewResolver.
		 */
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		// The prefix+string returned by controller+suffix page will be invoked
		// for the view component.
		resolver.setPrefix("/WEB-INF/pages/");
		resolver.setSuffix(".jsp");

		return resolver;

	}
}
