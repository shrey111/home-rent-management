package com.uwindsor.project.configs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.datasource.init.DatabasePopulator;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;;

/**
 * @author Afnan Ur Rehman
 */

@EnableJpaRepositories("com.uwindsor.project")
@EnableTransactionManagement
@Configuration
public class DataSourceConfig {

	@Autowired
	private Environment environment;

	@Bean("dataSource")
	public DataSource dataSource() {

		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(environment.getProperty("jdbc.driverClass"));
		dataSource.setUrl(environment.getProperty("jdbc.url"));
		dataSource.setUsername(environment.getProperty("jdbc.userName"));
		dataSource.setPassword(environment.getProperty("jdbc.password"));

		return dataSource;
	}
	 
	 @Bean("entityManagerFactory")
	    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
	        LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
	        entityManagerFactory.setDataSource(dataSource());
	        entityManagerFactory.setJpaVendorAdapter(jpaVendorAdapter());
	        entityManagerFactory.setPackagesToScan("com.uwindsor.project.models");
	        
	        Properties jpaProperties = new Properties();
	        jpaProperties.setProperty("hibernate.hbm2ddl.auto", "create");
	        entityManagerFactory.setJpaProperties(jpaProperties);
	        
	        return entityManagerFactory;
	    }

	@Bean
		public JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
			JpaTransactionManager jpaTransactionManager = new JpaTransactionManager();
			jpaTransactionManager.setEntityManagerFactory(entityManagerFactory);
			
			DatabasePopulatorUtils.execute(databasePopulator(), dataSource());
			
			return jpaTransactionManager;
		}
	 
	    @Bean
	    public JpaVendorAdapter jpaVendorAdapter() {
	        HibernateJpaVendorAdapter hibernateJpaVendorAdapter = new HibernateJpaVendorAdapter();
	        hibernateJpaVendorAdapter.setDatabase(Database.MYSQL);
	        hibernateJpaVendorAdapter.setShowSql(true);
	        hibernateJpaVendorAdapter.setGenerateDdl(true);
	        
	        return hibernateJpaVendorAdapter;
	    }

	    @Bean
	    public DatabasePopulator databasePopulator() {
	    	 ResourceDatabasePopulator databasePopulator = new ResourceDatabasePopulator();
	    	 databasePopulator.setContinueOnError(true);
	    	 databasePopulator.addScript(new ClassPathResource("data.sql"));
	    	 
	    	 return databasePopulator;
	    }
	    
}
