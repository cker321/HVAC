package org.apache.httpcore.message;

import org.apache.httpcore.HeaderElement;
import org.apache.httpcore.NameValuePair;
import org.apache.httpcore.util.Args;
import org.apache.httpcore.util.LangUtils;

/* loaded from: classes.dex */
public class BasicHeaderElement implements HeaderElement, Cloneable {
    private final String name;
    private final NameValuePair[] parameters;
    private final String value;

    public BasicHeaderElement(String str, String str2, NameValuePair[] nameValuePairArr) {
        this.name = (String) Args.notNull(str, "Name");
        this.value = str2;
        if (nameValuePairArr != null) {
            this.parameters = nameValuePairArr;
        } else {
            this.parameters = new NameValuePair[0];
        }
    }

    public BasicHeaderElement(String str, String str2) {
        this(str, str2, null);
    }

    @Override // org.apache.httpcore.HeaderElement
    public String getName() {
        return this.name;
    }

    @Override // org.apache.httpcore.HeaderElement
    public String getValue() {
        return this.value;
    }

    @Override // org.apache.httpcore.HeaderElement
    public NameValuePair[] getParameters() {
        return (NameValuePair[]) this.parameters.clone();
    }

    @Override // org.apache.httpcore.HeaderElement
    public int getParameterCount() {
        return this.parameters.length;
    }

    @Override // org.apache.httpcore.HeaderElement
    public NameValuePair getParameter(int i) {
        return this.parameters[i];
    }

    @Override // org.apache.httpcore.HeaderElement
    public NameValuePair getParameterByName(String str) {
        Args.notNull(str, "Name");
        for (NameValuePair nameValuePair : this.parameters) {
            if (nameValuePair.getName().equalsIgnoreCase(str)) {
                return nameValuePair;
            }
        }
        return null;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof HeaderElement)) {
            return false;
        }
        BasicHeaderElement basicHeaderElement = (BasicHeaderElement) obj;
        return this.name.equals(basicHeaderElement.name) && LangUtils.equals(this.value, basicHeaderElement.value) && LangUtils.equals((Object[]) this.parameters, (Object[]) basicHeaderElement.parameters);
    }

    public int hashCode() {
        int iHashCode = LangUtils.hashCode(LangUtils.hashCode(17, this.name), this.value);
        for (NameValuePair nameValuePair : this.parameters) {
            iHashCode = LangUtils.hashCode(iHashCode, nameValuePair);
        }
        return iHashCode;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.name);
        if (this.value != null) {
            sb.append("=");
            sb.append(this.value);
        }
        for (NameValuePair nameValuePair : this.parameters) {
            sb.append("; ");
            sb.append(nameValuePair);
        }
        return sb.toString();
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
