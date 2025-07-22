package org.apache.httpcore;

/* loaded from: classes.dex */
public interface Header extends NameValuePair {
    HeaderElement[] getElements() throws ParseException;
}
