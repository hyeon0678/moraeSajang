package kr.co.morae.listener;

import javax.servlet.ServletContextEvent;

import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

@Component
public class MyContextLoaderListener extends ContextLoaderListener {
	@Override
    public void contextDestroyed(ServletContextEvent event) {
        Thread.interrupted();
        super.contextDestroyed(event);
    }
}
