package org.apache.commons.p006io.input;

import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.apache.commons.p006io.input.ObservableInputStream;

/* loaded from: classes.dex */
public class MessageDigestCalculatingInputStream extends ObservableInputStream {
    private final MessageDigest messageDigest;

    public static class MessageDigestMaintainingObserver extends ObservableInputStream.Observer {

        /* renamed from: md */
        private final MessageDigest f286md;

        public MessageDigestMaintainingObserver(MessageDigest messageDigest) {
            this.f286md = messageDigest;
        }

        @Override // org.apache.commons.io.input.ObservableInputStream.Observer
        void data(int i) throws IOException {
            this.f286md.update((byte) i);
        }

        @Override // org.apache.commons.io.input.ObservableInputStream.Observer
        void data(byte[] bArr, int i, int i2) throws IOException {
            this.f286md.update(bArr, i, i2);
        }
    }

    public MessageDigestCalculatingInputStream(InputStream inputStream, MessageDigest messageDigest) {
        super(inputStream);
        this.messageDigest = messageDigest;
        add(new MessageDigestMaintainingObserver(messageDigest));
    }

    public MessageDigestCalculatingInputStream(InputStream inputStream, String str) throws NoSuchAlgorithmException {
        this(inputStream, MessageDigest.getInstance(str));
    }

    public MessageDigestCalculatingInputStream(InputStream inputStream) throws NoSuchAlgorithmException {
        this(inputStream, MessageDigest.getInstance("MD5"));
    }

    public MessageDigest getMessageDigest() {
        return this.messageDigest;
    }
}
