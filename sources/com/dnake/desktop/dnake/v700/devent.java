package com.dnake.desktop.dnake.v700;

import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* loaded from: classes.dex */
public class devent {
    public static Boolean boot = false;
    private static List<devent> elist;
    public String url;

    public void process(String str) {
    }

    public devent(String str) {
        this.url = str;
    }

    public static void event(String str, String str2) {
        List<devent> list;
        Boolean bool = true;
        if (boot.booleanValue() && (list = elist) != null) {
            Iterator<devent> it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                devent next = it.next();
                if (str.equals(next.url)) {
                    next.process(str2);
                    bool = false;
                    break;
                }
            }
        }
        if (bool.booleanValue()) {
            dmsg.ack(480, null);
        }
    }

    public static void setup() {
        elist = new LinkedList();
        elist.add(new devent("/exApp/io") { // from class: com.dnake.desktop.dnake.v700.devent.1
            @Override // com.dnake.desktop.dnake.v700.devent
            public void process(String str) throws IOException {
                dmsg.ack(200, null);
                dxml dxmlVar = new dxml();
                dxmlVar.parse(str);
                int[] iArr = new int[8];
                for (int i = 0; i < 8; i++) {
                    iArr[i] = dxmlVar.getInt("/params/io" + i, 0);
                    System.err.println("/params/io" + i + " = " + iArr[i]);
                }
            }
        });
    }
}
