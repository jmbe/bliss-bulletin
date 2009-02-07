/* Copyright 2006-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.codehaus.groovy.grails.plugins.springsecurity;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.metadata.Attributes;
import org.springframework.security.SecurityConfig;
import org.springframework.security.annotation.Secured;

/**
 * Re-implementation of Acegi's {@link SecurityAnnotationAttributes} as a temporary
 * fix until I can figure out how to do this correctly in 2.0.
 *
 * @author <a href='mailto:beckwithb@studentsonly.com'>Burt Beckwith</a>
 */
public class SecurityAnnotationAttributes implements Attributes {

	/**
	 * {@inheritDoc}
	 * @see org.springframework.metadata.Attributes#getAttributes(java.lang.Class)
	 */
	@SuppressWarnings("unchecked")
	public Set<SecurityConfig> getAttributes(final Class target) {
		Set<SecurityConfig> attributes = new HashSet<SecurityConfig>();

		for (Annotation annotation : target.getAnnotations()) {
			if (annotation instanceof Secured) {
				Secured attr = (Secured)annotation;
				for (String auth : attr.value()) {
					attributes.add(new SecurityConfig(auth));
				}
				break;
			}
		}

		return attributes;
	}

	/**
	 * {@inheritDoc}
	 * @see org.springframework.metadata.Attributes#getAttributes(java.lang.reflect.Method)
	 */
	public Set<SecurityConfig> getAttributes(final Method method) {
		Set<SecurityConfig> attributes = new HashSet<SecurityConfig>();

		Annotation[] annotations = AnnotationUtils.getAnnotations(method);
		for (Annotation annotation : annotations) {
			if (annotation instanceof Secured) {
				Secured attr = (Secured)annotation;
				for (String auth : attr.value()) {
					attributes.add(new SecurityConfig(auth));
				}

				break;
			}
		}

		return attributes;
	}

	/**
	 * {@inheritDoc}
	 * @see org.springframework.metadata.Attributes#getAttributes(java.lang.Class, java.lang.Class)
	 */
	@SuppressWarnings("unchecked")
	public Collection getAttributes(final Class clazz, final Class filter) {
		throw new UnsupportedOperationException("Unsupported operation");
	}

	/**
	 * {@inheritDoc}
	 * @see org.springframework.metadata.Attributes#getAttributes(java.lang.reflect.Method, java.lang.Class)
	 */
	@SuppressWarnings("unchecked")
	public Collection getAttributes(final Method method, final Class clazz) {
		throw new UnsupportedOperationException("Unsupported operation");
	}

	/**
	 * {@inheritDoc}
	 * @see org.springframework.metadata.Attributes#getAttributes(java.lang.reflect.Field)
	 */
	@SuppressWarnings("unchecked")
	public Collection getAttributes(final Field field) {
		throw new UnsupportedOperationException("Unsupported operation");
	}

	/**
	 * {@inheritDoc}
	 * @see org.springframework.metadata.Attributes#getAttributes(java.lang.reflect.Field, java.lang.Class)
	 */
	@SuppressWarnings("unchecked")
	public Collection getAttributes(final Field field, final Class clazz) {
		throw new UnsupportedOperationException("Unsupported operation");
	}
}
