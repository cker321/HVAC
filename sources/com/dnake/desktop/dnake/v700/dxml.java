package com.dnake.desktop.dnake.v700;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.StringTokenizer;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.eclipse.paho.client.mqttv3.MqttTopic;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

/* loaded from: classes.dex */
public class dxml {
    Document doc;
    DocumentBuilder docBuilder;
    DocumentBuilderFactory docFactory;

    public dxml() {
        this.docBuilder = null;
        DocumentBuilderFactory documentBuilderFactoryNewInstance = DocumentBuilderFactory.newInstance();
        this.docFactory = documentBuilderFactoryNewInstance;
        try {
            this.docBuilder = documentBuilderFactoryNewInstance.newDocumentBuilder();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
        this.doc = this.docBuilder.newDocument();
    }

    public boolean parse(String str) {
        if (str == null || str.length() < 16) {
            return false;
        }
        return parse(new ByteArrayInputStream(str.getBytes()));
    }

    public boolean parse(InputStream inputStream) {
        if (inputStream == null) {
            return false;
        }
        try {
            this.doc = this.docBuilder.parse(inputStream);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } catch (SAXException e2) {
            e2.printStackTrace();
            return false;
        }
    }

    public Node findFirstElement(Node node, String str) {
        if (node != null && node.hasChildNodes()) {
            for (Node firstChild = node.getFirstChild(); firstChild != null; firstChild = firstChild.getNextSibling()) {
                if (firstChild.getNodeName().equals(str)) {
                    return firstChild;
                }
            }
        }
        return null;
    }

    public int getInt(String str, int i) {
        String text = getText(str);
        return (text == null || text.length() >= 11) ? i : Integer.parseInt(text);
    }

    public String getText(String str, String str2) {
        String text = getText(str);
        return text == null ? str2 : text;
    }

    public String getText(String str) {
        Node firstChild = this.doc.getFirstChild();
        if (firstChild == null) {
            return null;
        }
        StringTokenizer stringTokenizer = new StringTokenizer(str, MqttTopic.TOPIC_LEVEL_SEPARATOR);
        if (!firstChild.getNodeName().equals(stringTokenizer.nextToken())) {
            return null;
        }
        while (firstChild != null && stringTokenizer.hasMoreTokens()) {
            firstChild = findFirstElement(firstChild, stringTokenizer.nextToken());
        }
        if (firstChild == null || !firstChild.hasChildNodes()) {
            return null;
        }
        return firstChild.getFirstChild().getNodeValue();
    }

    public void setInt(String str, int i) throws DOMException {
        setText(str, String.valueOf(i));
    }

    public void setText(String str, String str2) throws DOMException {
        Node firstChild = this.doc.getFirstChild();
        StringTokenizer stringTokenizer = new StringTokenizer(str, MqttTopic.TOPIC_LEVEL_SEPARATOR);
        String strNextToken = stringTokenizer.nextToken();
        if (firstChild == null) {
            firstChild = this.doc.createElement(strNextToken);
            this.doc.appendChild(firstChild);
        }
        while (stringTokenizer.hasMoreTokens()) {
            String strNextToken2 = stringTokenizer.nextToken();
            Node nodeFindFirstElement = findFirstElement(firstChild, strNextToken2);
            if (nodeFindFirstElement == null) {
                Element elementCreateElement = this.doc.createElement(strNextToken2);
                firstChild.appendChild(elementCreateElement);
                firstChild = elementCreateElement;
            } else {
                firstChild = nodeFindFirstElement;
            }
        }
        if (str2 != null) {
            firstChild.appendChild(this.doc.createTextNode(str2));
        }
    }

    public String toString() throws TransformerException {
        Transformer transformerNewTransformer;
        try {
            transformerNewTransformer = TransformerFactory.newInstance().newTransformer();
        } catch (TransformerConfigurationException e) {
            e.printStackTrace();
            transformerNewTransformer = null;
        }
        StringWriter stringWriter = new StringWriter();
        try {
            transformerNewTransformer.transform(new DOMSource(this.doc), new StreamResult(stringWriter));
        } catch (TransformerException e2) {
            e2.printStackTrace();
        }
        return stringWriter.toString();
    }

    public Boolean load(String str) {
        Boolean bool = false;
        try {
            FileInputStream fileInputStream = new FileInputStream(str);
            if (parse(fileInputStream)) {
                bool = true;
            }
            fileInputStream.close();
        } catch (FileNotFoundException unused) {
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bool;
    }

    public void save(String str) throws IOException {
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(str);
            fileOutputStream.write(toString().getBytes());
            fileOutputStream.flush();
            fileOutputStream.getFD().sync();
            fileOutputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
    }
}
