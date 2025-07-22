package org.apache.commons.p006io.output;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.UUID;
import org.apache.commons.p006io.TaggedIOException;

/* loaded from: classes.dex */
public class TaggedOutputStream extends ProxyOutputStream {
    private final Serializable tag;

    public TaggedOutputStream(OutputStream outputStream) {
        super(outputStream);
        this.tag = UUID.randomUUID();
    }

    public boolean isCauseOf(Exception exc) {
        return TaggedIOException.isTaggedWith(exc, this.tag);
    }

    public void throwIfCauseOf(Exception exc) throws IOException {
        TaggedIOException.throwCauseIfTaggedWith(exc, this.tag);
    }

    @Override // org.apache.commons.p006io.output.ProxyOutputStream
    protected void handleIOException(IOException iOException) throws IOException {
        throw new TaggedIOException(iOException, this.tag);
    }
}
